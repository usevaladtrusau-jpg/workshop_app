namespace airline.db;

using {
  cuid,
  managed,
  Currency
} from '@sap/cds/common';
using airline.db.Customers from './customers';
using airline.db.BookingsCustomers from './bookingsCustomers';

type BookingStatuses : String enum {
  Pending;
  PendingPayment;
  Confirmed;
  Cancelled;
  Expired;
  Completed
}

@assert.unique.unique_bookingReference: [bookingReference]
entity Bookings : cuid, managed {
  customer          : Association to one Customers;
  status            : BookingStatuses @mandatory;
  currency          : Currency;
  totalPrice        : Decimal(12, 3)  @mandatory;
  bookingReference  : String(20)      @mandatory;
  expiresAt         : Timestamp;

  bookingsCustomers : Association to many BookingsCustomers
                        on bookingsCustomers.booking = $self;
}
