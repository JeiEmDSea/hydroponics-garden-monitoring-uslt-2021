import 'dart:convert';

import 'package:garden_monitor/enums/parameter_enum.dart';
import 'package:garden_monitor/models/parameter_reading.dart';
import 'package:garden_monitor/models/readings.dart';
import 'package:http/http.dart' as http;

class ReadingsService {
  String baseUrl = '';

  ReadingsService(this.baseUrl);

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

  Future<List<ParameterReading>> getParameterReadings(
      String gardenId, Parameter parameter) async {
    var url = Uri.parse(baseUrl +
        '/garden/readings?gardenId=' +
        gardenId +
        '&parameter=' +
        parameter.index.toString());
    return http.get(url).then((data) {
      if (data.statusCode == 200) {
        var readingsJson = jsonDecode(data.body) as List;
        List<ParameterReading> result = readingsJson
            .map((json) => ParameterReading.fromJson(json))
            .toList();

        return result;
      }

      return List<ParameterReading>.empty();
    }).catchError((error) {});
  }
}
