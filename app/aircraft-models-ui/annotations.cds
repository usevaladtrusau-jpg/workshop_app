using AirlineService as service from '../../srv/airline-service';

annotate service.AircraftModels with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'manufacturer',
        Value: manufacturer,
      },
      {
        $Type: 'UI.DataField',
        Label: 'modelName',
        Value: modelName,
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
      Label: 'manufacturer',
      Value: manufacturer,
    },
    {
      $Type: 'UI.DataField',
      Label: 'modelName',
      Value: modelName,
    },
  ],
);
