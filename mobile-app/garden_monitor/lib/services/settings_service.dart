import 'dart:convert';

import 'package:garden_monitor/models/settings.dart';
import 'package:http/http.dart' as http;

class SettingsService {
  String baseUrl = '';

  SettingsService(this.baseUrl);

  Future<Settings> getSettings(String gardenId) async {
    var url = Uri.parse(baseUrl + '/garden/settings?gardenId=' + gardenId);
    return http.get(url).then((data) {
      if (data.statusCode == 200) {
        var settingsJson = jsonDecode(data.body);
        final settings = Settings(
          gardenId: settingsJson['gardenId'],
          maxSoilMoisture:
              double.parse(settingsJson['maxSoilMoisture'].toString()),
          minSoilMoisture:
              double.parse(settingsJson['minSoilMoisture'].toString()),
          maxWaterLevel: double.parse(settingsJson['maxWaterLevel'].toString()),
          minWaterLevel: double.parse(settingsJson['minWaterLevel'].toString()),
          maxTemperature:
              double.parse(settingsJson['maxTemperature'].toString()),
          maxPh: double.parse(settingsJson['maxPh'].toString()),
          minPh: double.parse(settingsJson['minPh'].toString()),
          minTds: double.parse(settingsJson['minTds'].toString()),
        );

        return settings;
      }

      throw Error();
    }).catchError((error) {});
  }

  Future<Settings> saveSettings(Settings settings) async {
    var url = Uri.parse(baseUrl + '/garden/settings');
    return http
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'gardenId': settings.gardenId,
              'maxSoilMoisture': settings.maxSoilMoisture.toString(),
              'minSoilMoisture': settings.minSoilMoisture.toString(),
              'maxWaterLevel': settings.maxWaterLevel.toString(),
              'minWaterLevel': settings.minWaterLevel.toString(),
              'maxTemperature': settings.maxTemperature.toString(),
              'maxPh': settings.maxPh.toString(),
              'minPh': settings.minPh.toString(),
              'minTds': settings.minTds.toString(),
            }))
        .then((data) {
      return settings;
    }).catchError((error) {});
  }
}
