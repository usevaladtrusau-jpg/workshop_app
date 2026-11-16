using AirlineService as service from '../../srv/airline-service';

annotate service.Customers with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data : [
      {
        $Type: 'UI.DataField',
        Label: 'firstName',
        Value: firstName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'lastName',
        Value: lastName,
      },
      {
        $Type: 'UI.DataField',
        Label: 'surname',
        Value: surname,
      },
      {
        $Type: 'UI.DataField',
        Label: 'dateOfBirth',
        Value: dateOfBirth,
      },
      {
        $Type: 'UI.DataField',
        Label: 'email',
        Value: email,
      },
      {
        $Type: 'UI.DataField',
        Label: 'documentNumber',
        Value: documentNumber,
      },
      {
        $Type: 'UI.DataField',
        Label: 'documentExpiry',
        Value: documentExpiry,
      },
      {
        $Type: 'UI.DataField',
        Label: 'role',
        Value: role,
      },
      {
        $Type: 'UI.DataField',
        Label: 'nationality_code',
        Value: nationality_code,
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
      Label: 'firstName',
      Value: firstName,
    },
    {
      $Type: 'UI.DataField',
      Label: 'lastName',
      Value: lastName,
    },
    {
      $Type: 'UI.DataField',
      Label: 'surname',
      Value: surname,
    },
    {
      $Type: 'UI.DataField',
      Label: 'dateOfBirth',
      Value: dateOfBirth,
    },
  ],
);
