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
  booking          : Association to one Bookings;
  passenger        : Association to one Customers;
  flight           : Association to one Flights;
  ticketNumber     : String(30)      @mandatory;
  totalPrice       : Decimal(12, 2)  @mandatory;
  currency         : String(3)       @mandatory;
  status           : TicketsStatuses @mandatory;
  issuedAt         : Timestamp;

  seatReservations : Association to many SeatReservations
                       on seatReservations.ticket = $self;
}
