import cds from "@sap/cds";

import type { Tickets } from "#cds-models/airline/db";

export class TicketRepository {
  public async getTicketById(ticketId: string): Promise<Tickets | null> {
    const query = SELECT.one.from("airline.db.Tickets").where({ ID: ticketId });
    // eslint-disable-next-line @typescript-eslint/no-unsafe-return
    return cds.run(query);
  }
}
