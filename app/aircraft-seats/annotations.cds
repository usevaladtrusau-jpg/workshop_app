using AirlineService as service from '../../srv/airline-service';

annotate service.AircraftsSeats with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'seatNumber',
        Value: seatNumber,
      },
      {
        $Type: 'UI.DataField',
        Label: 'cabinClass',
        Value: cabinClass,
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
      Label: 'seatNumber',
      Value: seatNumber,
    },
    {
      $Type: 'UI.DataField',
      Label: 'cabinClass',
      Value: cabinClass,
    },
  ],
);

annotate service.AircraftsSeats with {
  aircraft @Common.ValueList: {
    $Type         : 'Common.ValueListType',
    CollectionPath: 'Aircrafts',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: aircraft_ID,
        ValueListProperty: 'ID',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'registrationNumber',
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status',
      },
    ],
  }
};
