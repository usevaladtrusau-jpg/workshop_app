using {airline as al} from '../db/schema';


service AirlineService {
  entity Tickets as projection on al.Ticket;
}
