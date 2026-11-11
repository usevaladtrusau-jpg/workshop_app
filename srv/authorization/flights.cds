using {AirlineService} from '../airline-service';

annotate AirlineService.Flights with @restrict: [
  {
    grant: 'READ',
    to   : ['any']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateFlights']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteFlights']
  },
  {
    grant: 'CREATE',
    to   : ['CreateFlights']
  }
]
