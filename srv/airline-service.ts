import cds from "@sap/cds";

export default class AirlineService extends cds.ApplicationService {
  async init(): Promise<void> {
    const paymentService = await cds.connect.to("PaymentService");

    this.on("makePayment", async (req: cds.Request) => {
      return paymentService.send({
        event: "makePayment",
        data: {
          ticketId: req.data.ticketId,
        },
      });
    });

    await super.init();
  }
}
