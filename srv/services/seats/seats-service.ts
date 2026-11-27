import cds from "@sap/cds";

import { SeatsHandler } from "../../handlers/seats/seats-handler";

export class SeatsService extends cds.ApplicationService {
  private readonly seatsHandler: SeatsHandler = new SeatsHandler();

  async init() {
    this.on("fillAircraft", this.fillAircraft);

    await super.init();
  }

  fillAircraft(req: cds.Request) {
    const { keyName } = req.data;

    if (!keyName) {
      return req.reject(400, "keyName is required");
    }

    try {
      return this.seatsHandler.fillAircraft();
    } catch (error: unknown) {
      const message = error instanceof Error ? error.message : String(error);

      return req.reject(500, `Failed to retrieve credential ${message}`);
    }
  }
}
