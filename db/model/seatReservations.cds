namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.AircraftSeats from './aircraftSeats';
using airline.db.Flights from './flights';
using airline.db.Tickets from './tickets';

type ReservationsStatuses : String enum {
  Held;
  Confirmed;
  Cancelled;
  Expired;
}

entity SeatReservations : cuid, managed {
  flight       : Association to one Flights;
  aircraftSeat : Association to one AircraftSeats;
  ticket       : Association to one Tickets;
  status       : ReservationsStatuses @mandatory;
  reservedAt   : Timestamp            @mandatory;
  expiresAt    : Timestamp;
}
