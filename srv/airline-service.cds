using {airline as al} from '../db/schema';


service AirlineService {
  entity AircraftModels    as projection on al.db.AircraftModels;
  entity Aircrafts         as projection on al.db.Aircrafts;
  entity AircraftsSeats    as projection on al.db.AircraftSeats;
  entity Airports          as projection on al.db.Airports;
  entity Bookings          as projection on al.db.Bookings;
  entity BookingsCustomers as projection on al.db.BookingsCustomers;
  entity Cities            as projection on al.db.Cities;
  entity Customers         as projection on al.db.Customers;
  entity Flights           as projection on al.db.Flights;
  entity Payments          as projection on al.db.Payments;
  entity Routes            as projection on al.db.Routes;
  entity SeatReservations  as projection on al.db.SeatReservations;
  entity Tickets           as projection on al.db.Tickets;
}
