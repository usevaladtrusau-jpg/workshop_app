namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Airports from './airports';
using airline.db.Flights from './flights';

entity Routes : cuid, managed {
  departureAirport : Association to one Airports;
  arrivalAirport   : Association to one Airports;

  flights          : Association to many Flights
                       on flights.route = $self;
}
