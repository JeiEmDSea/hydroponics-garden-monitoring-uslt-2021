import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garden_monitor/components/header.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/enums/parameter_enum.dart';
import 'package:garden_monitor/models/readings.dart';
import 'package:garden_monitor/widgets/info_card.dart';

class Body extends StatelessWidget {
  final Readings readings;
  final bool isLoading;
  final String gardenId;

  const Body({
    Key? key,
    required this.readings,
    required this.isLoading,
    required this.gardenId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(size: size),
          isLoading
              ? Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding,
                  ),
                  child: const CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding,
                  ),
                  height: 500,
                  width: double.infinity,
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    clipBehavior: Clip.none,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      InfoCard(
                        title: 'Soil Moisture',
                        value: readings.soliMoisture.reversed.last,
                        unit: '%',
                        icon: Icons.local_florist,
                        iconColor: Colors.orange,
                        readingValues: readings.soliMoisture,
                        parameter: Parameter.SoilMoisture,
                        gardenId: gardenId,
                      ),
                      InfoCard(
                        title: 'Water Level',
                        value: readings.waterLevel.reversed.last,
                        unit: '%',
                        icon: Icons.invert_colors,
                        iconColor: Colors.blue,
                        readingValues: readings.waterLevel,
                        parameter: Parameter.WaterLevel,
                        gardenId: gardenId,
                      ),
                      InfoCard(
                        title: 'Humidity',
                        value: readings.humidity.reversed.last,
                        unit: '%',
                        icon: Icons.ac_unit,
                        iconColor: Colors.green,
                        readingValues: readings.humidity,
                        parameter: Parameter.Humidity,
                        gardenId: gardenId,
                      ),
                      InfoCard(
                        title: 'Temperature',
                        value: readings.temperature.reversed.last,
                        unit: '°C',
                        icon: Icons.thermostat,
                        iconColor: Colors.red,
                        readingValues: readings.temperature,
                        parameter: Parameter.Temperature,
                        gardenId: gardenId,
                      ),
                      InfoCard(
                        title: 'pH Level',
                        value: readings.phLevel.reversed.last,
                        unit: 'pH',
                        icon: Icons.sanitizer,
                        iconColor: Colors.pink,
                        readingValues: readings.phLevel,
                        parameter: Parameter.PhLevel,
                        gardenId: gardenId,
                      ),
                      InfoCard(
                        title: 'TDS',
                        value: readings.tds.reversed.last,
                        unit: 'PPM',
                        icon: Icons.addchart,
                        iconColor: Colors.purple,
                        readingValues: readings.tds,
                        parameter: Parameter.Tds,
                        gardenId: gardenId,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
