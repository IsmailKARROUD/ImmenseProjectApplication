import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:imense/Widgets/indicator.dart';

class PieChartDataModel {
  final String name;
  final double value;
  final Color color;

  PieChartDataModel(
      {required this.name, required this.value, required this.color});
}

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({super.key, required this.dataPie});
  final List<PieChartDataModel> dataPie;

  @override
  State<StatefulWidget> createState() => CustomPieChartState();
}

class CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex = -1;

  List<PieChartSectionData> showingSections() {
    return List.generate(widget.dataPie.length, (index) {
      final isTouched = index == touchedIndex;
      return PieChartSectionData(
        color: widget.dataPie[index].color,
        value: widget.dataPie[index].value,
        title: '${widget.dataPie[index].value}%',
        radius: isTouched ? 60.0 : 50.0,
        titleStyle: TextStyle(
          fontSize: isTouched ? 25.0 : 0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: const [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      );
    });
  }

  List<Indicator> listName() {
    return List.generate(widget.dataPie.length, (index) {
      return Indicator(
          color: widget.dataPie[index].color,
          text: widget.dataPie[index].name,
          isSquare: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          height: 200,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: showingSections(),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listName(),
        ),
      ],
    );
  }
}
