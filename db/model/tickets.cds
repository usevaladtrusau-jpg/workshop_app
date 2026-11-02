namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Bookings from './bookings';
using airline.db.Customers from './customers';
using airline.db.Flights from './flights';
using airline.db.SeatReservations from './seatReservations';

type TicketsStatuses : String enum {
  Issued;
  Cancelled;
  Refunded;
  Used;
  Voided;
}

@assert.unique.unique_ticketNumber: [ticketNumber]
entity Tickets : cuid, managed {
  passenger  : Association to one Customers;
  flight     : Association to one Flights;
  totalPrice : Decimal(12, 2)  @mandatory;
  status     : TicketsStatuses @mandatory;
}
