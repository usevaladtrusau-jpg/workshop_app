using AirlineService as service from '../../srv/airline-service';

annotate service.Airports with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'iata code',
        Value: iataCode,
      },
      {
        $Type: 'UI.DataField',
        Label: 'icao code',
        Value: icaoCode,
      },
      {
        $Type: 'UI.DataField',
        Label: 'city',
        Value: city_ID,
      },
      {
        $Type: 'UI.DataField',
        Label: 'name',
        Value: name,
      },
      {
        $Type: 'UI.DataField',
        Label: 'timezone',
        Value: timeZone_code,
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
      Label: 'iata code',
      Value: iataCode,
    },
    {
      $Type: 'UI.DataField',
      Label: 'icao code',
      Value: icaoCode,
    },
    {
      $Type: 'UI.DataField',
      Label: 'city',
      Value: city.name
    },
    {
      $Type: 'UI.DataField',
      Label: 'name',
      Value: name,
    },
    {
      $Type: 'UI.DataField',
      Label: 'timezone',
      Value: timeZone_code,
    },
  ],
);

annotate service.Airports with {
  city @Common.ValueList: {
    $Type         : 'Common.ValueListType',
    CollectionPath: 'Cities',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: city_ID,
        ValueListProperty: 'ID',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'country_code',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name',
      },
    ],
  }
};
