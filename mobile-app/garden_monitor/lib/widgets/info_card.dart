import 'package:flutter/material.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/widgets/line_chart.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final double value;
  final String unit;
  final IconData icon;
  final Color iconColor;
  final List<double> readingValues;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.iconColor,
    required this.readingValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
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
        );
      },
    );
  }
}
