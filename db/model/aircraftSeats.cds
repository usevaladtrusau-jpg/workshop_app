namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Aircrafts from './aircrafts';
using airline.db.Tickets from './tickets';

type CabinClasses : String enum {
  Economy;
  PremiumEconomy;
  Business;
  First;
}

@assert.unique.unique_seatNumbers: [
  aircraft,
  seatNumber
]
entity AircraftSeats : cuid, managed {
  aircraft   : Association to one Aircrafts;
  seatNumber : String(3)    @mandatory;
  cabinClass : CabinClasses @mandatory;

  tickets    : Association to one Tickets
                 on tickets.aircraftSeats = $self;
}
