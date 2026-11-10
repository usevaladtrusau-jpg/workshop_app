using {AirlineService} from '../airline-service';

annotate AirlineService.SeatReservations with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadSeatReservations']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateSeatReservations']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteSeatReservations']
  },
  {
    grant: 'CREATE',
    to   : ['CreateSeatReservations']
  }
]
