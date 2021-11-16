import 'dart:convert';

import 'package:garden_monitor/models/readings.dart';
import 'package:http/http.dart' as http;

class ReadingsService {
  static const baseUrl = 'https://ffcf-58-69-124-94.ngrok.io';

  Future<Readings> getReadings(String gardenId) async {
    var url = Uri.parse(baseUrl + '/garden?gardenId=' + gardenId);
    return http.get(url).then((data) {
      if (data.statusCode == 200) {
        var readingsJson = jsonDecode(data.body);
        final readings = Readings(
            soliMoisture: List<double>.from(readingsJson['soilMoisture']),
            waterLevel: List<double>.from(readingsJson['waterLevel']),
            humidity: List<double>.from(readingsJson['humidity']),
            temperature: List<double>.from(readingsJson['temperature']),
            phLevel: List<double>.from(readingsJson['phLevel']),
            tds: List<double>.from(readingsJson['tds']));

        return readings;
      }

      return Readings(
          soliMoisture: [],
          waterLevel: [],
          humidity: [],
          temperature: [],
          phLevel: [],
          tds: []);
    }).catchError((error) {});
  }
}
