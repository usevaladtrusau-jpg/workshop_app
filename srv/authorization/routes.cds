using {AirlineService} from '../airline-service';

annotate AirlineService.Routes with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadRoutes']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateRoutes']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteRoutes']
  },
  {
    grant: 'CREATE',
    to   : ['CreateRoutes']
  }
]
