using {AirlineService} from '../airline-service';

annotate AirlineService.Aircrafts with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadAircrafts']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateAircrafts']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteAircrafts']
  },
  {
    grant: 'CREATE',
    to   : ['CreateAircrafts']
  }
]
