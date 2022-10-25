import 'package:corona_api_app/app/services/api.dart';

class EndpointsData {
  EndpointsData({required this.values});
  final Map<Endpoint, int> values;
  int? get cases => values[Endpoint.cases];
  int? get casesSuspected => values[Endpoint.cases];
  int? get casesConfirmed => values[Endpoint.cases];
  int? get deaths => values[Endpoint.cases];
  int? get recovered => values[Endpoint.cases];

  @override
  String toString() =>
      'cases: $cases, casesSuspected: $casesSuspected, casesConfirmed: $casesConfirmed, deaths: $deaths, recovered: $recovered';
}
