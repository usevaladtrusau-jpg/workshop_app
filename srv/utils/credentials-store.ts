import cds from "@sap/cds";
import jose from "node-jose";
import https from "node:https";
import { URL } from "node:url";

interface CredentialStoreBinding {
  url: string;
  username: string;

  certificate: string;
  key: string;

  encryption: {
    client_private_key: string;
    server_public_key: string;
  };
}

const CREDENTIALS_STORE_NAME = "airline-credentials-store";

export class CredentialsStore {
  private static async requestCredential(
    binding: CredentialStoreBinding,
    name: string,
    namespace: string,
  ): Promise<string> {
    const url = new URL(
      `password?name=${encodeURIComponent(name)}`,
      binding.url.endsWith("/") ? binding.url : `${binding.url}/`,
    );

    return new Promise((resolve, reject) => {
      const request = https.request(
        url,
        {
          method: "GET",

          // Mutual TLS authentication
          cert: binding.certificate,
          key: binding.key,

          rejectUnauthorized: true,

          headers: {
            "sapcp-credstore-namespace": namespace,
            "Cache-Control": "no-cache",
          },
        },
        (response) => {
          let body = "";

          response.setEncoding("utf8");

          response.on("data", (chunk: string) => {
            body += chunk;
          });

          response.on("end", () => {
            if (
              response.statusCode === undefined ||
              response.statusCode < 200 ||
              response.statusCode >= 300
            ) {
              reject(
                new Error(
                  `Credential Store HTTP ${response.statusCode}: ${body}`,
                ),
              );
              return;
            }

            resolve(body);
          });
        },
      );

      request.on("error", reject);
      request.end();
    });
  }

  private static getCredentialStoreBindingFromLocal(): CredentialStoreBinding {
    const credentials = cds.env.requires.credstore?.credentials;

    if (!credentials) {
      throw new Error(
        "Credentials Store binding 'credstore' is not configured",
      );
    }

    return credentials as CredentialStoreBinding;
  }

  private static getCredentialStoreBinding(): CredentialStoreBinding {
    const raw = process.env.VCAP_SERVICES;

    if (!raw) {
      throw new Error("VCAP_SERVICES is not configured");
    }

    const services = JSON.parse(raw) as Record<
      string,
      Array<{
        name: string;
        credentials: CredentialStoreBinding;
      }>
    >;

    const bindings = Object.values(services).flat();

    const binding = bindings.find(
      (service) => service.name === CREDENTIALS_STORE_NAME,
    );

    if (!binding) {
      throw new Error(
        `Credentials Store instance '${CREDENTIALS_STORE_NAME}' not found in VCAP_SERVICES`,
      );
    }

    return binding.credentials;
  }

  static async readPassword(name: string): Promise<string> {
    const binding = this.getCredentialStoreBinding();
    const namespace = "airline-credentials-space";

    const encryptedPayload = await this.requestCredential(
      binding,
      name,
      namespace,
    );

    const privateKey = await jose.JWK.asKey(
      `-----BEGIN PRIVATE KEY-----\n${binding.encryption.client_private_key}\n-----END PRIVATE KEY-----`,
      "pem",
      {
        alg: "RSA-OAEP-256",
        enc: "A256GCM",
      },
    );

    const decrypted =
      await jose.JWE.createDecrypt(privateKey).decrypt(encryptedPayload);

    const credential = JSON.parse(decrypted.plaintext.toString("utf8"));

    return credential.value as string;
  }
}
