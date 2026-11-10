@requires: 'authenticated-user'
service SecretsService {
  function getSecrets(keyName: String) returns String;
}

annotate SecretsService.getSecrets with @restrict: [{
  grant: 'EXECUTE',
  to   : ['ReadSecrets']
}]
