import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:garden_monitor/constants.dart';

class LineReportChart extends StatelessWidget {
  final List<double> readingValues;

  const LineReportChart({
    Key? key,
    required this.readingValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: getSpots(),
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              colors: [kPrimaryColor],
              barWidth: 4,
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> getSpots() {
    List<FlSpot> result = [];

    if (readingValues.isNotEmpty) {
      readingValues.asMap().forEach((index, val) {
        result.add(FlSpot(index.toDouble(), val));
      });
    }

    return result;
  }
}
