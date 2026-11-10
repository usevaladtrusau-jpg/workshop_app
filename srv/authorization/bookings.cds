using {AirlineService} from '../airline-service';

annotate AirlineService.Bookings with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadBookings']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateBookings']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteBookings']
  },
  {
    grant: 'CREATE',
    to   : ['CreateBookings']
  }
]
