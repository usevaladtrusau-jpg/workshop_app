namespace airline.db;

using {cuid, managed} from '@sap/cds/common';
using airline.db.Bookings from './bookings';

type PaymentStatuses : String enum {
  Pending;
  Processing;
  Succeeded;
  Failed;
  Cancelled;
  RefundPending;
  PartiallyRefunded;
  Refunded;
}

entity Payments : cuid, managed {
  booking           : Association to one Bookings;
  provider          : String(50)      @mandatory;
  providerPaymentId : String(256);
  totalPrice        : Decimal(12, 3)  @mandatory;
  currency          : String(3)       @mandatory;
  status            : PaymentStatuses @mandatory;
  paidAt            : Timestamp;
}
