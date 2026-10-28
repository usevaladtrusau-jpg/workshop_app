namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.SeatReservations from './seatReservations';
using airline.db.Routes from './routes';
using airline.db.Aircrafts from './aircrafts';
using airline.db.Tickets from './tickets';

type FlightStatuses : String enum {
  Scheduled;
  Boarding;
  Departed;
  InAir;
  Landed;
  Completed;
  Delayed;
  Cancelled;
  Diverted
}

entity Flights : cuid, managed {
  flightNumber         : String(10)     @mandatory;
  scheduledDepartureAt : Timestamp      @mandatory;
  scheduledArrivalAt   : Timestamp      @mandatory;
  actualDepartureAt    : Timestamp      @mandatory;
  actualArrivalAt      : Timestamp      @mandatory;
  route                : Association to one Routes;
  aircraft             : Association to one Aircrafts;
  boardingGate         : String(10);
  status               : FlightStatuses @mandatory;

  seatReservations     : Association to many SeatReservations
                           on seatReservations.flight = $self;
  tickets              : Association to many Tickets
                           on tickets.flight = $self;
}
