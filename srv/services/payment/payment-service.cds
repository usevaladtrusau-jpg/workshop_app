using {airline.db as al} from '../../../db/schema';

service PaymentService {
  entity Tickets  as projection on al.Tickets;
  entity Payments as projection on al.Payments;

  action   makePayment(ticketId: String) returns String;

  function success()                     returns String;
  function cancel()                      returns String;
}
