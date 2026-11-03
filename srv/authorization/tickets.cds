using {AirlineService} from '../airline-service';

annotate AirlineService.Tickets with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadTickets']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateTickets']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteTickets']
  },
  {
    grant: 'CREATE',
    to   : ['CreateTickets']
  }
]
