import { TicketRepository } from "../../repositories/ticket-repositories";
import { DestinationService } from "../../utils/destination.service";

import { TicketStatus } from "./constants";

export class PaymentHandler {
  private readonly ticketRepository: TicketRepository = new TicketRepository();

  public async executePayment(ticketId: string) {
    await this.checkTicket(ticketId);

    const destinationService = new DestinationService("StripeApi");
    const successUrl = process.env.STRIPE_SUCCESS_URL!;
    const cancelUrl = process.env.STRIPE_CANCEL_URL!;

    const body = new URLSearchParams({
      mode: "payment",
      success_url: successUrl,
      cancel_url: cancelUrl,
      "metadata[orderId]": ticketId,
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

  public async checkTicket(ticketId: string) {
    const ticket = await this.ticketRepository.getTicketById(ticketId);

    if (!ticket) {
      throw new Error("Ticket with provided id was not found.");
    }

    if (ticket.status === TicketStatus.Paid) {
      throw new Error("Provided ticket has been already paid");
    }
  }
}
