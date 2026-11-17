using AirlineService as service from '../../srv/airline-service';

annotate service.Routes with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'Departure Airport',
        Value: departureAirport_ID
      },
      {
        $Type: 'UI.DataField',
        Label: 'Arrival Airport',
        Value: arrivalAirport_ID
      }
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
      Label: 'ID',
      Value: ID
    },
    {
      $Type: 'UI.DataField',
      Label: 'Departure Airport',
      Value: departureAirport.name
    },
    {
      $Type: 'UI.DataField',
      Label: 'Departure City',
      Value: departureAirport.city.name
    },
    {
      $Type: 'UI.DataField',
      Label: 'Arrival Airport',
      Value: arrivalAirport.name
    },
    {
      $Type: 'UI.DataField',
      Label: 'Arrival City',
      Value: arrivalAirport.city.name
    }
  ],
);

annotate service.Routes with {
  departureAirport @Common.ValueList: {
    $Type         : 'Common.ValueListType',
    CollectionPath: 'Airports',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: departureAirport_ID,
        ValueListProperty: 'ID',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'iataCode',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'icaoCode',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'timeZone_code',
      },
    ],
  }
};

annotate service.Routes with {
  arrivalAirport @Common.ValueList: {
    $Type         : 'Common.ValueListType',
    CollectionPath: 'Airports',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: arrivalAirport_ID,
        ValueListProperty: 'ID',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'iataCode',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'icaoCode',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'timeZone_code',
      },
    ],
  }
};
