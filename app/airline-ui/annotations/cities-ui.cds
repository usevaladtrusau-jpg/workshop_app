using AirlineService from '../../../srv/airline-service';
using from '../../../srv/airline-service';

annotate AirlineService.Cities with @(UI.LineItem #tableMacro: [
  {
    $Type: 'UI.DataField',
    Value: ID,
    Label: 'ID',
  },
  {
    $Type: 'UI.DataField',
    Value: name,
    Label: 'name',
  },
]);
