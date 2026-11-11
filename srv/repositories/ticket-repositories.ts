import cds from "@sap/cds";

import { Ticket } from "#cds-models/airline/db";

export class TicketRepository {
  public async getTicketById(ticketId: string): Promise<Ticket | null> {
    const query = SELECT.one.from("airline.db.Tickets").where({ ID: ticketId });

    return cds.run(query);
  }

  public async updateTicket(
    ticketId: string,
    payload: Partial<Ticket>,
  ): Promise<void> {
    await cds.run(
      UPDATE("airline.db.Tickets").set(payload).where({ ID: ticketId }),
    );
  }
}
