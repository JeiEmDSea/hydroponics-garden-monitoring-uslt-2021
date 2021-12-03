import 'package:flutter/material.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/models/parameter_reading.dart';
import 'package:intl/intl.dart';

class ReadingScreen extends StatelessWidget {
  final List<ParameterReading> readings;
  final IconData icon;
  final String title;
  final String unit;

  const ReadingScreen({
    Key? key,
    required this.readings,
    required this.icon,
    required this.title,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title Readings'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: readings.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text('${readings[index].value} $unit'),
                  subtitle: Text(DateFormat('MMM dd, yyyy – hh:mm:a')
                      .format(readings[index].timeStamp.toLocal())),
                  leading: Icon(icon)));
        },
      ),
    );
  }
}
