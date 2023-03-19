import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomBarChart extends StatelessWidget {
  CustomBarChart({super.key, this.barGroups = const []});

  List<BarChartGroupData>? barGroups;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BarChart(BarChartData(
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              )),
          barGroups: barGroups)),
    );
  }
}
