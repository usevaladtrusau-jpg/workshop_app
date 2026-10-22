import cds from "@sap/cds";

export default class MainService extends cds.ApplicationService {
  async init() {
    this.before("*", "*", () => {});

    return super.init();
  }
}
