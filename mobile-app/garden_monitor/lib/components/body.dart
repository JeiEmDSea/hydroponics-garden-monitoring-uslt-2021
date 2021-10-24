import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:garden_monitor/components/header.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/widgets/info_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(size: size),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            height: 300,
            width: double.infinity,
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: const <Widget>[
                InfoCard(
                  title: 'Temperature',
                  value: 36,
                  unit: '°C',
                  iconPath: 'assets/icons/temperature.svg',
                  iconColor: Colors.red,
                ),
                InfoCard(
                  title: 'Water Level',
                  value: 89,
                  unit: '%',
                  iconPath: 'assets/icons/water_level.svg',
                  iconColor: Colors.blue,
                ),
                InfoCard(
                  title: 'Humidity',
                  value: 27,
                  unit: '%',
                  iconPath: 'assets/icons/humidity.svg',
                  iconColor: Colors.green,
                ),
                InfoCard(
                  title: 'Sunlight',
                  value: 36,
                  unit: 'LUX',
                  iconPath: 'assets/icons/sun.svg',
                  iconColor: Colors.orange,
                ),
                InfoCard(
                  title: 'PH Level',
                  value: 7,
                  unit: 'pH',
                  iconPath: 'assets/icons/temperature.svg',
                  iconColor: Colors.pink,
                ),
                InfoCard(
                  title: 'TDS',
                  value: 550,
                  unit: 'PPM',
                  iconPath: 'assets/icons/temperature.svg',
                  iconColor: Colors.purple,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
