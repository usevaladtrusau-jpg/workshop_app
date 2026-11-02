import { ApplicationService, Request } from "@sap/cds";

import { PaymentHandler } from "../../handlers/payment.handler";

export class PaymentService extends ApplicationService {
  private readonly paymentHandler: PaymentHandler = new PaymentHandler();
  async init() {
    this.on("makePayment", this.paymentAction);

    await super.init();
  }

  public async paymentAction(req: Request) {
    const { ticketId } = req.data;

    const paymentUrl = await this.paymentHandler.executePayment();
    console.log("PAYMENT URL", paymentUrl, ticketId);
  }
}
