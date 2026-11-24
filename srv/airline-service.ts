import cds from "@sap/cds";

export default class AirlineService extends cds.ApplicationService {
  async init(): Promise<void> {
    await super.init();
  }
}
