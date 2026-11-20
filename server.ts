import cds from "@sap/cds";
import express from "express";
import Stripe from "stripe";

import { TicketStatus } from "./srv/handlers/payment/constants";
import { TicketRepository } from "./srv/repositories/ticket-repositories";
import { getVariable } from "./srv/utils/common";

const ticketRepository = new TicketRepository();

cds.once("bootstrap", (app) => {
  app.post(
    "/paymentWebhook",
    express.raw({ type: "application/json" }),
    async (req, res) => {
      let metadata: Stripe.Metadata | null = null;
      let paymentId: string | undefined = undefined;
      let price: number = 0;

      const stripe = await getStripe();
      const signatureHeader = req.headers["stripe-signature"];
      const endpointSecret = await getVariable("STRIPE_WEBHOOK_SECRET");

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

async function getStripe() {
  const strypeSecretKey = await getVariable("STRIPE_SECRET_KEY");

  if (!strypeSecretKey) {
    throw new Error("No stripe secret key provided");
  }
  const stripe = new Stripe(strypeSecretKey);

  return stripe;
}
