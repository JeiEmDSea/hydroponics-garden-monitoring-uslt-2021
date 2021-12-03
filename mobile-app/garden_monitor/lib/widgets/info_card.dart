import 'package:flutter/material.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/enums/parameter_enum.dart';
import 'package:garden_monitor/models/parameter_reading.dart';
import 'package:garden_monitor/screens/readings_screen.dart';
import 'package:garden_monitor/services/readings_service.dart';
import 'package:garden_monitor/widgets/line_chart.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final double value;
  final String unit;
  final IconData icon;
  final Color iconColor;
  final List<double> readingValues;
  final Parameter parameter;
  final String gardenId;

  final readingsService =
      ReadingsService('https://plantronics-api.azurewebsites.net');

  InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.iconColor,
    required this.readingValues,
    required this.parameter,
    required this.gardenId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () async {
            final List<ParameterReading> list =
                await readingsService.getParameterReadings(gardenId, parameter);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ReadingScreen(
                      readings: list,
                      icon: icon,
                      title: title,
                      unit: unit,
                    )));
          },
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: kTextColor),
                            children: [
                              TextSpan(
                                text: '$value \n',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: unit,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: LineReportChart(
                          readingValues: readingValues,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
