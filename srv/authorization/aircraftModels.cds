using {AirlineService} from '../airline-service';

annotate AirlineService.AircraftModels with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadAircraftModels']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateAircraftModels']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteAircraftModels']
  },
  {
    grant: 'CREATE',
    to   : ['CreateAircraftModels']
  }
]
