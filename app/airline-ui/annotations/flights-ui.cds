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
    ],
  },
  UI.Facets                    : [
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'GeneratedFacet1',
      Label : 'General Information',
      Target: '@UI.FieldGroup#GeneratedGroup',
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Tickets',
      ID    : 'Tickets',
      Target: 'tickets/@UI.LineItem#Tickets',
    },
  ],
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

annotate service.Tickets with @(UI.LineItem #Tickets: [
  {
    $Type: 'UI.DataField',
    Value: totalPrice,
    Label: 'totalPrice',
  },
  {
    $Type: 'UI.DataField',
    Value: status,
    Label: 'status',
  },
  {
    $Type: 'UI.DataField',
    Value: aircraftSeats.cabinClass,
    Label: 'cabinClass',
  },
]);
