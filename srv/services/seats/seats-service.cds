@requires: 'authenticated-user'
service SeatsService {
  action fillAircraft(keyName: String) returns String;
}

annotate SeatsService.fillAircraft with @restrict: [{
  grant: 'EXECUTE',
  to   : ['FillAircraft']
}]
