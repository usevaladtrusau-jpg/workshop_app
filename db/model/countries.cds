namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Cities from './cities';

entity Countries : cuid, managed {
  name : String(100) @mandatory;
}
