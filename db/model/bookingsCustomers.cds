namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Customers from './customers';
using airline.db.Bookings from './bookings';


entity BookingsCustomers : cuid, managed {
  customer : Association to one Customers;
  booking  : Association to one Bookings;
}
