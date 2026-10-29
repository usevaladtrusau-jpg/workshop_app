namespace airline.db;

using {
  cuid,
  managed,
  Country
} from '@sap/cds/common';
using airline.db.Airports from './airports.cds';

entity Cities : cuid, managed {
  country  : Country;
  name     : String(150) @mandatory;

  airports : Association to many Airports
               on airports.city = $self;
}
