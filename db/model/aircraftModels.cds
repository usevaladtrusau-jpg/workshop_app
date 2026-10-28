namespace airline.db;

using {cuid, managed} from '@sap/cds/common';

entity AircraftModels : cuid, managed {
  manufacturer : String(100) @mandatory;
  modelName    : String(100) @mandatory;
}
