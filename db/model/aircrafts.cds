namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.AircraftModels from './aircraftModels';
using airline.db.AircraftSeats from './aircraftSeats';
using airline.db.Flights from './flights';

type AircraftStatuses : String enum {
  Active;
  InMaintenance;
  Grounded;
  OutOfService;
  Retired
}

entity Aircrafts : cuid, managed {
  model              : Association to one AircraftModels;
  registrationNumber : String(30)       @mandatory;
  status             : AircraftStatuses @mandatory;

  seats              : Association to many AircraftSeats
                         on seats.aircraft = $self;
  flights            : Association to many Flights
                         on flights.aircraft = $self;
}
