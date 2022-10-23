import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final responce = await http.post(
      api.tokenUri(),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );
    if (responce.statusCode == 200) {
      final data = jsonDecode(responce.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    print(
        'Request ${api.tokenUri()} failed\nRessponse: ${responce.statusCode} ${responce.reasonPhrase}');
    throw responce;
  }

  Future<int> getEndpointData({
    required String accessToken,
    required Endpoint endpoint,
  }) async {
    final uri = api.endpointUri(endpoint);
    final responce =
        await http.get(uri, headers: {'Authorization': 'Bearer $accessToken'});
    if (responce.statusCode == 200) {
      final List<dynamic> data = jsonDecode(responce.body);
      if (data.isNotEmpty) {
        final Map<String, dynamic> endpointData = data[0];
        final String? responseJsonKey = _responseJsonKey[endpoint];
        final int? result = endpointData[responseJsonKey];
        if (result != null) {
          return result;
        }
      }
    }
    print(
        'Request ${api.tokenUri()} failed\nRessponse: ${responce.statusCode} ${responce.reasonPhrase}');
    throw responce;
  }

  static final Map<Endpoint, String> _responseJsonKey = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'data',
    Endpoint.casesConfirmed: 'data',
    Endpoint.deaths: 'data',
    Endpoint.recovered: 'data',
  };
}
