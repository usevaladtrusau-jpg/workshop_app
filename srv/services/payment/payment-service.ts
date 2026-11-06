import { ApplicationService, Request } from "@sap/cds";

import { PaymentHandler } from "../../handlers/payment.handler";

export class PaymentService extends ApplicationService {
  private readonly paymentHandler: PaymentHandler = new PaymentHandler();
  async init() {
    this.on("makePayment", this.paymentAction);
    this.on("success", this.successFunction);
    this.on("cancel", this.cancelFunction);

    await super.init();
  }

  public async paymentAction(req: Request) {
    const { ticketId } = req.data;

    return await this.paymentHandler.executePayment(ticketId);
  }

  public successFunction() {
    return "You have paid successfully.";
  }

  public cancelFunction() {
    return "Something went wrong";
  }
}
