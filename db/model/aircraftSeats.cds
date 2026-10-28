namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Aircrafts from './aircrafts';
using airline.db.SeatReservations from './seatReservations';

type CabinClasses : String enum {
  Economy;
  PremiumEconomy;
  Business;
  First;
}

entity AircraftSeats : cuid, managed {
  aircraft         : Association to one Aircrafts;
  seatNumber       : String(3)    @mandatory;
  cabinClass       : CabinClasses @mandatory;

  seatReservations : Association to many SeatReservations
                       on seatReservations.aircraftSeat = $self;
}
