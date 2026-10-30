using {AirlineService} from '../airline-service';

annotate AirlineService.BookingsCustomers with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadBookingsCustomers']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateBookingsCustomers']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteBookingsCustomers']
  },
  {
    grant: 'CREATE',
    to   : ['CreateBookingsCustomers']
  }
]
