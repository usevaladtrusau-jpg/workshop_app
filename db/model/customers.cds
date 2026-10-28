namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Bookings from './bookings';
using airline.db.BookingsCustomers from './bookingsCustomers';
using airline.db.Tickets from './tickets';

type CustomersRoles : String enum {
  Passenger;
  Manager;
}

entity Customers : cuid, managed {
  firstName         : String(15)     @mandatory;
  lastName          : String(15)     @mandatory;
  surname           : String(15);
  passwordHash      : String(256)    @mandatory;
  dateOfBirth       : Date;
  email             : String(50)     @mandatory;
  documentNumber    : String(100);
  documentExpiry    : Date;
  role              : CustomersRoles @mandatory;
  nationality       : String(2);

  bookings          : Association to many Bookings
                        on bookings.customer = $self;
  bookingsCustomers : Association to many BookingsCustomers
                        on bookingsCustomers.customer = $self;
  tickets           : Association to many Tickets
                        on tickets.passenger = $self;
}
