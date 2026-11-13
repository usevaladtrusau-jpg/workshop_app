using AirlineService from '../../../srv/airline-service';
using from '../../../srv/airline-service';


annotate AirlineService.Tickets with @(UI.LineItem #tableMacro: []);

annotate AirlineService.Tickets with @(UI.SelectionFields: [totalPrice]);
