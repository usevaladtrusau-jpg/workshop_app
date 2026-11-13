import { CredentialsStore } from "./credentials-store";

export async function getVariable(name: string) {
  const variable: string | undefined =
    process.env.NODE_ENV === "development"
      ? process.env[name]
      : await CredentialsStore.readPassword(name);

  if (!variable) {
    throw new Error(`Do not provide parameter for ${name}`);
  }

  return variable;
}
