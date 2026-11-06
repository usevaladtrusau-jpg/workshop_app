import cds from "@sap/cds";

import { Ticket } from "#cds-models/airline";

export class TicketRepository {
  public async getTicketById(ticketId: string): Promise<Ticket | undefined> {
    const query = SELECT.one.from(Ticket).where({ ID: ticketId });
    // eslint-disable-next-line @typescript-eslint/no-unsafe-return
    return cds.run(query);
  }
}
