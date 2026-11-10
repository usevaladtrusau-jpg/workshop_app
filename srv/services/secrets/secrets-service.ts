import cds from "@sap/cds";

import { CredentialsStore } from "../../utils/credentials-store";

export class SecretsService extends cds.ApplicationService {
  async init() {
    this.on("getSecrets", this.secretsActions);

    await super.init();
  }

  async secretsActions(req: cds.Request) {
    const { keyName } = req.data;

    if (!keyName) {
      return req.reject(400, "keyName is required");
    }

    try {
      return await CredentialsStore.readPassword(keyName);
    } catch (error: unknown) {
      const message = error instanceof Error ? error.message : String(error);

      return req.reject(500, `Failed to retrieve credential ${message}`);
    }
  }
}
