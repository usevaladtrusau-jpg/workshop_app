using AirlineService as service from '../../srv/airline-service';

annotate service.Aircrafts with @(UI.HeaderInfo: {
  TypeName      : 'Aircraft',
  TypeNamePlural: 'Aircrafts',

  Title         : {
    $Type: 'UI.DataField',
    Value: registrationNumber
  },

  Description   : {
    $Type: 'UI.DataField',
    Value: model.modelName
  }
});

annotate service.Aircrafts with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'registration number',
        Value: registrationNumber,
      },
      {
        $Type: 'UI.DataField',
        Label: 'status',
        Value: status,
      },
      {
        $Type: 'UI.DataField',
        Label: 'aircraft model',
        Value: model_ID,
      }
    ]
  },
  UI.Facets                    : [
    {
      $Type : 'UI.CollectionFacet',
      Label : 'Aircraft Seats',
      ID    : 'AircraftSeats',
      Facets: [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'Seats',
        Target: 'seats/@UI.LineItem#Seats',
      }, ],
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'GeneratedFacet1',
      Label : 'General Information',
      Target: '@UI.FieldGroup#GeneratedGroup',
    },
  ],
  UI.LineItem                  : [
    {
      $Type: 'UI.DataField',
      Label: 'registration number',
      Value: registrationNumber,
    },
    {
      $Type: 'UI.DataField',
      Label: 'status',
      Value: status,
    },
    {
      $Type: 'UI.DataField',
      Label: 'aircraft model',
      Value: model.modelName,
    }
  ]
);

annotate service.Aircrafts with {
  model @(
    Common.Text           : model.modelName,
    Common.TextArrangement: #TextOnly,
    Common.ValueList      : {
      $Type         : 'Common.ValueListType',
      CollectionPath: 'AircraftModels',
      Parameters    : [
        {
          $Type            : 'Common.ValueListParameterInOut',
          LocalDataProperty: model_ID,
          ValueListProperty: 'ID',
        },
        {
          $Type            : 'Common.ValueListParameterDisplayOnly',
          ValueListProperty: 'manufacturer',
        },
        {
          $Type            : 'Common.ValueListParameterDisplayOnly',
          ValueListProperty: 'modelName',
        },
      ],
    },
  );
};

annotate service.AircraftsSeats with @(UI.LineItem #Seats: []);
