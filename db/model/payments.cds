namespace airline.db;

using {cuid, managed, } from '@sap/cds/common';
using airline.db.Tickets from './tickets';

entity Payments : cuid, managed {
  ticket     : Association to one Tickets;
  totalPrice : Decimal(12, 3) @mandatory;
  paidAt     : Timestamp;
}
