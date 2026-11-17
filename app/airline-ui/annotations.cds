using AirlineService from '../../srv/airline-service';

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
        $Type: 'UI.DataField',
        Label: 'route',
        Value: route_ID,
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
      Label: 'flight number',
      Value: flightNumber,
    },
    {
      $Type: 'UI.DataField',
      Label: 'departure airport',
      Value: route.departureAirport.name,
    },

    {
      $Type: 'UI.DataField',
      Label: 'arrival airport',
      Value: route.arrivalAirport.name,
    },
    {
      $Type: 'UI.DataField',
      Label: 'scheduled departure at',
      Value: scheduledDepartureAt,
    },
    {
      $Type: 'UI.DataField',
      Label: 'scheduled arrival at',
      Value: scheduledArrivalAt,
    },
    {
      $Type: 'UI.DataField',
      Label: 'actual departure at',
      Value: actualDepartureAt,
    },
    {
      $Type: 'UI.DataField',
      Label: 'actual arrival at',
      Value: actualArrivalAt,
    },
  ],
);

annotate AirlineService.Flights with @(UI.SelectionFields: [
  status,
  actualDepartureAt
]);

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

annotate AirlineService.Tickets with @(UI.LineItem #tableMacro: []);

annotate AirlineService.Tickets with @(UI.SelectionFields: [totalPrice]);

annotate AirlineService.Flights with {
  route @(
    Common.Text           : model.modelName,
    Common.TextArrangement: #TextOnly,
    Common.ValueList      : {
      $Type         : 'Common.ValueListType',
      CollectionPath: 'AircraftModels',
      Parameters    : [
        {
          $Type            : 'Common.ValueListParameterInOut',
          LocalDataProperty: route_ID,
          ValueListProperty: 'ID',
        },
        {
          $Type            : 'Common.ValueListParameterDisplayOnly',
          ValueListProperty: 'departureAirport/name',
        },
        {
          $Type            : 'Common.ValueListParameterDisplayOnly',
          ValueListProperty: 'arrivalAirport_name',
        },
      ],
    },
  );
};
