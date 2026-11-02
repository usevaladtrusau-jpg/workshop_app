import { DestinationService } from "../utils/destination.service";

export class PaymentHandler {
  public async executePayment() {
    const destinationService = new DestinationService("StripeApi");

    const body = new URLSearchParams({
      mode: "payment",
      success_url: "http://localhost:4004/odata/v4/PaymentService/success",
      cancel_url: "http://localhost:4004/odata/v4/PaymentService/cancel",
      "metadata[orderId]": "ORDER-12345",
      "line_items[0][quantity]": "1",
      "line_items[0][price_data][currency]": "usd",
      "line_items[0][price_data][unit_amount]": "1000",
      "line_items[0][price_data][product_data][name]": "Flight Ticket",
    });

    const response = await destinationService.makeRequest<{ url: string }>(
      "POST",
      "/v1/checkout/sessions",
      body.toString(),
      { "Content-Type": "application/x-www-form-urlencoded" },
    );

    return response.url;
  }
}
