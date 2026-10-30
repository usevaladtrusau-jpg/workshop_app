using {AirlineService} from '../airline-service';

annotate AirlineService.Cities with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadCities']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateCities']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteCities']
  },
  {
    grant: 'CREATE',
    to   : ['CreateCities']
  }
]
