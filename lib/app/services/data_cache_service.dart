import 'package:corona_api_app/app/repositories/endpoinat_data.dart';
import 'package:corona_api_app/app/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCacheService {
  DataCacheService({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  static String endpointValueKey(Endpoint endpoint) => '$endpoint/value';
  static String endpointDateKey(Endpoint endpoint) => '$endpoint/date';

  

  Future<void> setData(EndpointsData endpointsData) async {
    endpointsData.values.forEach((endpoint, endpointData) async {
      await sharedPreferences.setInt(
          endpointValueKey(endpoint), endpointData.value);
      await sharedPreferences.setString(
        endpointValueKey(endpoint),
        endpointData.date.toString(),
      );
    });
  }
}