POLICY Passenger {
    ASSIGN ROLE ReadCustomers;
    ASSIGN ROLE UpdateCustomers;
    ASSIGN ROLE DeleteCustomers;
    ASSIGN ROLE CreateCustomers;
    ASSIGN ROLE ReadFlights;
    ASSIGN ROLE ReadRoutes;
    ASSIGN ROLE ReadAirports;
    ASSIGN ROLE CreateBookings;
    ASSIGN ROLE CreateTickets;
    ASSIGN ROLE ReadSeatReservations;
    ASSIGN ROLE DeleteSeatReservations;
    ASSIGN ROLE UpdateSeatReservations;
    ASSIGN ROLE CreateSeatReservations;
}

POLICY BookingAgent {
    ASSIGN ROLE UpdateCustomers;
    ASSIGN ROLE CreateBookings;
    ASSIGN ROLE ReadBookings;
    ASSIGN ROLE DeleteBookings;
    ASSIGN ROLE UpdateBookings;
    ASSIGN ROLE CreateBookings;
    ASSIGN ROLE ReadBookingsCustomers;
    ASSIGN ROLE DeleteBookingsCustomers;
    ASSIGN ROLE UpdateBookingsCustomers;
    ASSIGN ROLE CreateBookingsCustomers;
    ASSIGN ROLE ReadTickets;
    ASSIGN ROLE DeleteTickets;
    ASSIGN ROLE UpdateTickets;
    ASSIGN ROLE CreateTickets;

    ASSIGN ROLE ReadSeatReservations;
    ASSIGN ROLE DeleteSeatReservations;
    ASSIGN ROLE UpdateSeatReservations;
    ASSIGN ROLE CreateSeatReservations;

    ASSIGN ROLE ReadFlights;
    ASSIGN ROLE ReadRoutes;
    ASSIGN ROLE ReadAircraftSeats;
    ASSIGN ROLE ReadPayments;
}

POLICY FlightOperator {
    ASSIGN ROLE ReadFlights;
    ASSIGN ROLE DeleteFlights;
    ASSIGN ROLE UpdateFlights;
    ASSIGN ROLE CreateFlights;
    ASSIGN ROLE ReadRoutes;
    ASSIGN ROLE ReadAirports;
    ASSIGN ROLE ReadAircrafts;
    ASSIGN ROLE ReadSeatReservations;
}

POLICY FinanceManager {
    ASSIGN ROLE ReadBookings;
    ASSIGN ROLE ReadTickets;
    ASSIGN ROLE ReadPayments;
    ASSIGN ROLE UpdatePayments;
    ASSIGN ROLE DeletePayments;
    ASSIGN ROLE CreatePayments;
    ASSIGN ROLE ReadCustomers;
    ASSIGN ROLE ReadTickets;
}

POLICY BusinessAdministrator {
    ASSIGN ROLE ReadSecrets;

    ASSIGN ROLE ReadCustomers;
    ASSIGN ROLE UpdateCustomers;
    ASSIGN ROLE DeleteCustomers;
    ASSIGN ROLE CreateCustomers;

    ASSIGN ROLE ReadAircraftModels;
    ASSIGN ROLE UpdateAircraftModels;
    ASSIGN ROLE DeleteAircraftModels;
    ASSIGN ROLE CreateAircraftModels;

    ASSIGN ROLE ReadAircrafts;
    ASSIGN ROLE DeleteAircrafts;
    ASSIGN ROLE UpdateAircrafts;
    ASSIGN ROLE CreateAircrafts;

    ASSIGN ROLE ReadAircraftSeats;
    ASSIGN ROLE DeleteAircraftSeats;
    ASSIGN ROLE UpdateAircraftSeats;
    ASSIGN ROLE CreateAircraftSeats;

    ASSIGN ROLE ReadAirports;
    ASSIGN ROLE DeleteAirports;
    ASSIGN ROLE UpdateAirports;
    ASSIGN ROLE CreateAirports;

    ASSIGN ROLE ReadBookings;
    ASSIGN ROLE DeleteBookings;
    ASSIGN ROLE UpdateBookings;
    ASSIGN ROLE CreateBookings;

    ASSIGN ROLE ReadBookingsCustomers;
    ASSIGN ROLE DeleteBookingsCustomers;
    ASSIGN ROLE UpdateBookingsCustomers;
    ASSIGN ROLE CreateBookingsCustomers;

    ASSIGN ROLE ReadCities;
    ASSIGN ROLE DeleteCities;
    ASSIGN ROLE UpdateCities;
    ASSIGN ROLE CreateCities;

    ASSIGN ROLE ReadFlights;
    ASSIGN ROLE DeleteFlights;
    ASSIGN ROLE UpdateFlights;
    ASSIGN ROLE CreateFlights;

    ASSIGN ROLE ReadPayments;
    ASSIGN ROLE DeletePayments;
    ASSIGN ROLE UpdatePayments;
    ASSIGN ROLE CreatePayments;

    ASSIGN ROLE ReadRoutes;
    ASSIGN ROLE DeleteRoutes;
    ASSIGN ROLE UpdateRoutes;
    ASSIGN ROLE CreateRoutes;

    ASSIGN ROLE ReadSeatReservations;
    ASSIGN ROLE DeleteSeatReservations;
    ASSIGN ROLE UpdateSeatReservations;
    ASSIGN ROLE CreateSeatReservations;

    ASSIGN ROLE ReadTickets;
    ASSIGN ROLE DeleteTickets;
    ASSIGN ROLE UpdateTickets;
    ASSIGN ROLE CreateTickets;
}

POLICY SecretsRole {
    ASSIGN ROLE ReadSecrets;
}