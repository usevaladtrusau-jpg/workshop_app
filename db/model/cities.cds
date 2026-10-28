namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Countries from './countries';
using airline.db.Airports from './airports.cds';

entity Cities : cuid, managed {
  country  : Association to one Countries;
  name     : String(150) @mandatory;

  airports : Association to many Airports
               on airports.city = $self;
}
