using {AirlineService} from '../airline-service';

annotate AirlineService.Customers with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadCustomers']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateCustomers']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteCustomers']
  },
  {
    grant: 'CREATE',
    to   : ['CreateCustomers']
  }
]
