import cds from "@sap/cds";

import { Ticket } from "#cds-models/airline";

export class TicketRepository {
  public async getTicketById(ticketId: string): Promise<Ticket | null> {
    const query = SELECT.one.from("airline.db.Tickets").where({ ID: ticketId });
    // eslint-disable-next-line @typescript-eslint/no-unsafe-return
    return cds.run(query);
  }
}
