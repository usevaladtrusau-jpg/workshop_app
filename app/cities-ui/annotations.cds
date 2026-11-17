using AirlineService as service from '../../srv/airline-service';

annotate service.Cities with @(UI.HeaderInfo: {
  TypeName      : 'City',
  TypeNamePlural: 'Cities',

  Title         : {
    $Type: 'UI.DataField',
    Value: name
  },

  Description   : {
    $Type: 'UI.DataField',
    Value: country.code
  }
});

annotate service.Cities with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'code',
        Value: country_code,
      },
      {
        $Type: 'UI.DataField',
        Label: 'name',
        Value: name,
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
      Label: 'code',
      Value: country_code,
    },
    {
      $Type: 'UI.DataField',
      Label: 'name',
      Value: name,
    },
  ],
);
