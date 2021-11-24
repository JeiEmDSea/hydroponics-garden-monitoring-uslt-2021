import 'dart:convert';

import 'package:garden_monitor/models/settings.dart';
import 'package:http/http.dart' as http;

class SettingsService {
  static const baseUrl = 'https://4235-112-198-95-34.ngrok.io';

  Future<Settings> getSettings(String gardenId) async {
    var url = Uri.parse(baseUrl + '/garden?gardenId=' + gardenId);
    return http.get(url).then((data) {
      if (data.statusCode == 200) {
        var settingsJson = jsonDecode(data.body);
        final settings = Settings(
          gardenId: settingsJson['gardenId'],
          maxSoilMoisture: settingsJson['maxSoilMoisture'],
          minSoilMoisture: settingsJson['minSoilMoisture'],
          maxWaterLevel: settingsJson['maxWaterLevel'],
          minWaterLevel: settingsJson['minWaterLevel'],
          maxTemperature: settingsJson['maxTemperature'],
          maxPh: settingsJson['maxPh'],
          minPh: settingsJson['minPh'],
          minTds: settingsJson['minTds'],
        );

        return settings;
      }

      throw Error();
    }).catchError((error) {});
  }
}
