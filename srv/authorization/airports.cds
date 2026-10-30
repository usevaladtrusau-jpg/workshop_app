using {AirlineService} from '../airline-service';

annotate AirlineService.Aircrafts with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadAirports']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateAirports']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteAirports']
  },
  {
    grant: 'CREATE',
    to   : ['CreateAirports']
  }
]
