import 'package:corona_api_app/app/services/api.dart';

import '../services/endpoint_data.dart';

class EndpointsData {
  EndpointsData({required this.values});
  final Map<Endpoint, EndpointData> values;
  EndpointData? get cases => values[Endpoint.cases];
  EndpointData? get casesSuspected => values[Endpoint.cases];
  EndpointData? get casesConfirmed => values[Endpoint.cases];
  EndpointData? get deaths => values[Endpoint.cases];
  EndpointData? get recovered => values[Endpoint.cases];

  @override
  String toString() =>
      'cases: $cases, casesSuspected: $casesSuspected, casesConfirmed: $casesConfirmed, deaths: $deaths, recovered: $recovered';
}
