namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Cities from './cities';
using airline.db.Routes from './routes';

@assert.unique.unique_codes: [
  iataCode,
  icaoCode
]
entity Airports : cuid, managed {
  city            : Association to one Cities;
  iataCode        : String(3)   @mandatory;
  icaoCode        : String(4);
  name            : String(200) @mandatory;
  timeZone        : String(64)  @mandatory;

  departureRoutes : Association to many Routes
                      on departureRoutes.departureAirport = $self;
  arrivalRoutes   : Association to many Routes
                      on arrivalRoutes.arrivalAirport = $self;
}
