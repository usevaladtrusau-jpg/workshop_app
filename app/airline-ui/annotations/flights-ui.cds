using AirlineService from '../../../srv/airline-service';
using from '../../../srv/airline-service';


annotate AirlineService.Flights with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'flightNumber',
        Value: flightNumber,
      },
      {
        $Type: 'UI.DataField',
        Label: 'scheduledDepartureAt',
        Value: scheduledDepartureAt,
      },
      {
        $Type: 'UI.DataField',
        Label: 'scheduledArrivalAt',
        Value: scheduledArrivalAt,
      },
      {
        $Type: 'UI.DataField',
        Label: 'actualDepartureAt',
        Value: actualDepartureAt,
      },
      {
        $Type: 'UI.DataField',
        Label: 'actualArrivalAt',
        Value: actualArrivalAt,
      },
      {
        $Type: 'UI.DataField',
        Label: 'boardingGate',
        Value: boardingGate,
      },
      {
        $Type: 'UI.DataField',
        Label: 'status',
        Value: status,
      },
      {
        $Type : 'UI.DataFieldForAction',
        Action: 'AirlineService.EntityContainer/makePayment',
        Label : 'makePayment',
      },
    ],
  },
  UI.Facets                    : [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'GeneratedFacet1',
    Label : 'General Information',
    Target: '@UI.FieldGroup#GeneratedGroup',
  }, ],
  UI.LineItem                  : [
    {
      $Type: 'UI.DataField',
      Label: 'flightNumber',
      Value: flightNumber,
    },
    {
      $Type: 'UI.DataField',
      Label: 'scheduledDepartureAt',
      Value: scheduledDepartureAt,
    },
    {
      $Type: 'UI.DataField',
      Label: 'scheduledArrivalAt',
      Value: scheduledArrivalAt,
    },
    {
      $Type: 'UI.DataField',
      Label: 'actualDepartureAt',
      Value: actualDepartureAt,
    },
    {
      $Type: 'UI.DataField',
      Label: 'actualArrivalAt',
      Value: actualArrivalAt,
    },
  ],
);

annotate AirlineService.Flights with @(UI.SelectionFields: [
  status,
  actualDepartureAt
]);
