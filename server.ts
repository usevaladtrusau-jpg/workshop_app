import cds from "@sap/cds";
import express from "express";
import Stripe from "stripe";

import { TicketStatus } from "./srv/handlers/payment/constants";
import { TicketRepository } from "./srv/repositories/ticket-repositories";

const ticketRepository = new TicketRepository();

cds.once("bootstrap", (app) => {
  app.post(
    "/paymentWebhook",
    express.raw({ type: "application/json" }),
    (req, res) => {
      let metadata: Stripe.Metadata | null = null;
      let paymentId: string | undefined = undefined;
      let price: number = 0;

      const stripe = getStripe();
      const signatureHeader = req.headers["stripe-signature"];
      const endpointSecret = process.env.STRIPE_WEBHOOK_SECRET as string;

      const event = stripe.webhooks.constructEvent(
        req.body,
        signatureHeader!,
        endpointSecret,
      );

      if (event.type === "checkout.session.completed") {
        metadata = event.data.object.metadata;
        paymentId = event.data.object.id;
        if (event.data.object.amount_total) {
          price = event.data.object.amount_total / 100;
        }
      }

      const ticketId = metadata!.orderId;
      ticketRepository.updateTicket(ticketId, { status: TicketStatus.Paid });

      res.json({ ticketId, paymentId, price });
    },
  );
});

function getStripe() {
  const strypeSecretKey = process.env.STRIPE_SECRET_KEY;

  if (!strypeSecretKey) {
    throw new Error("No stripe secret key provided");
  }
  const stripe = new Stripe(strypeSecretKey);

  return stripe;
}
