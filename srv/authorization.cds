using {AirlineService} from './airline-service';

annotate AirlineService.AircraftModels with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadAircraftModels']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateAircraftModels']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteAircraftModels']
  },
  {
    grant: 'CREATE',
    to   : ['CreateAircraftModels']
  }
];

annotate AirlineService.Aircrafts with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadAircrafts']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateAircrafts']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteAircrafts']
  },
  {
    grant: 'CREATE',
    to   : ['CreateAircrafts']
  }
];

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
];

annotate AirlineService.Airports with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadAirports']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateAirports']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteAirports']
  },
  {
    grant: 'CREATE',
    to   : ['CreateAirports']
  }
];

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
];

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
];

annotate AirlineService.Cities with @restrict: [
  {
    grant: 'READ',
    to   : ['ReadCities']
  },
  {
    grant: 'UPDATE',
    to   : ['UpdateCities']
  },
  {
    grant: 'DELETE',
    to   : ['DeleteCities']
  },
  {
    grant: 'CREATE',
    to   : ['CreateCities']
  }
];

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
];

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
];

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
];

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
];

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
];

annotate AirlineService.Tickets with @restrict: [
  {
    grant: 'READ',
    to   : ['any']
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
];
