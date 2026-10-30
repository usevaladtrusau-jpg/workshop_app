using {AirlineService} from '../airline-service';

annotate AirlineService.Payments with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadPayments']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdatePayments']
  },
  {
    grant: 'DELETE',
    to   : ['DeletePayments']
  },
  {
    grant: 'CREATE',
    to   : ['CreatePayments']
  }
]
