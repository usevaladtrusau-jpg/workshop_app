using {airline as al} from '../db/schema';

service AirlineService {
  @odata.draft.enabled
  entity AircraftModels    as projection on al.db.AircraftModels;

  @odata.draft.enabled
  entity Aircrafts         as projection on al.db.Aircrafts;

  @odata.draft.enabled
  entity AircraftsSeats    as projection on al.db.AircraftSeats;

  @odata.draft.enabled
  entity Airports          as projection on al.db.Airports;

  @odata.draft.enabled
  entity Bookings          as projection on al.db.Bookings;

  @odata.draft.enabled
  entity BookingsCustomers as projection on al.db.BookingsCustomers;

  @odata.draft.enabled
  entity Cities            as projection on al.db.Cities;

  @odata.draft.enabled
  entity Customers         as projection on al.db.Customers;

  @odata.draft.enabled
  entity Flights           as projection on al.db.Flights;

  @odata.draft.enabled
  entity Payments          as projection on al.db.Payments;

  @odata.draft.enabled
  entity Routes            as projection on al.db.Routes;

  @odata.draft.enabled
  entity SeatReservations  as projection on al.db.SeatReservations;

  @odata.draft.enabled
  entity Tickets           as projection on al.db.Tickets;

  action makePayment(ticketId: String) returns String;
}
