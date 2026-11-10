using {AirlineService} from '../airline-service';

annotate AirlineService.AircraftsSeats with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadAircraftSeats']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateAircraftSeats']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteAircraftSeats']
  },
  {
    grant: 'CREATE',
    to   : ['CreateAircraftSeats']
  }
]
