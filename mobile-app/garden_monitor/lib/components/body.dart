import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garden_monitor/components/header.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/models/readings.dart';
import 'package:garden_monitor/widgets/info_card.dart';

class Body extends StatelessWidget {
  final Readings readings;
  final bool isLoading;

  const Body({
    Key? key,
    required this.readings,
    required this.isLoading,
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
                  height: 300,
                  width: double.infinity,
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: <Widget>[
                      InfoCard(
                        title: 'Soil Moisture',
                        value: readings.soliMoisture.last,
                        unit: '%',
                        icon: Icons.local_florist,
                        iconColor: Colors.orange,
                        readingValues: readings.soliMoisture,
                      ),
                      InfoCard(
                        title: 'Water Level',
                        value: readings.waterLevel.last,
                        unit: '%',
                        icon: Icons.invert_colors,
                        iconColor: Colors.blue,
                        readingValues: readings.waterLevel,
                      ),
                      InfoCard(
                        title: 'Humidity',
                        value: readings.humidity.last,
                        unit: '%',
                        icon: Icons.ac_unit,
                        iconColor: Colors.green,
                        readingValues: readings.humidity,
                      ),
                      InfoCard(
                        title: 'Temperature',
                        value: readings.temperature.last,
                        unit: '°C',
                        icon: Icons.thermostat,
                        iconColor: Colors.red,
                        readingValues: readings.temperature,
                      ),
                      InfoCard(
                        title: 'pH Level',
                        value: readings.phLevel.last,
                        unit: 'pH',
                        icon: Icons.sanitizer,
                        iconColor: Colors.pink,
                        readingValues: readings.phLevel,
                      ),
                      InfoCard(
                        title: 'TDS',
                        value: readings.tds.last,
                        unit: 'PPM',
                        icon: Icons.addchart,
                        iconColor: Colors.purple,
                        readingValues: readings.tds,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
