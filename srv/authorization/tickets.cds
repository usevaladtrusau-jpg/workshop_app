using {AirlineService} from '../airline-service';

annotate AirlineService.SeatReservations with @restrict: [
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
