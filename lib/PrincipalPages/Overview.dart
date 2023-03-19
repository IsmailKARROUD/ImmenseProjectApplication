import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:imense/CustomGraph/CustomBarChart.dart';
import 'package:imense/CustomGraph/pie_chart.dart';
import 'package:imense/Widgets/Pop-Up_screen.dart';
import 'package:imense/Widgets/statistics.dart';
import 'package:imense/Widgets/stats.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  final List<double> data = [0.0, 0.2, 0.5, 0.8, 1.0, 0.9, 0.7, 0.4, 0.1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overview"),
        actions: [
          //TODO:the icon changes when there's a notification
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.grey,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/ogw/AAEL6sh986hGvy1NHD8lgAyNQmaCDkbJOu-RgjMgDnsJ6Q=s64-c-mo',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Stats(),
            Statistics(
              title: 'My observations',
              subtitle: 'Statistics',
              graph: CustomBarChart(barGroups: [
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                    toY: 10,
                    width: 15,
                  ),
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(toY: 5, width: 15),
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(toY: 15, width: 15),
                ]),
                BarChartGroupData(x: 4, barRods: [
                  BarChartRodData(toY: 2, width: 15),
                ]),
                BarChartGroupData(x: 5, barRods: [
                  BarChartRodData(toY: 11, width: 15),
                ]),
                BarChartGroupData(x: 6, barRods: [
                  BarChartRodData(toY: 12, width: 15),
                ]),
                BarChartGroupData(x: 7, barRods: [
                  BarChartRodData(toY: 10, width: 15),
                ]),
                BarChartGroupData(x: 8, barRods: [
                  BarChartRodData(toY: 10, width: 15),
                ]),
              ]),
              listofFilters: const [
                'Daily',
                'Safety',
                'Excellent',
                'Work clothes,E.P.I',
                'Bad condition'
              ],
              options: [
                OptionPopUp(Icons.home, "Option 1", () {
                  // Do something when Option 1 is pressed
                }),
                OptionPopUp(Icons.home, "Option 2", () {
                  // Do something when Option 2 is pressed
                }),
                OptionPopUp(Icons.home, "Option 3", () {
                  // Do something when Option 3 is pressed
                })
              ],
            ),
            Statistics(
              title: 'My observations',
              subtitle: 'Statistics',
              options: [
                OptionPopUp(Icons.home, "Option 1", () {
                  // Do something when Option 1 is pressed
                }),
                OptionPopUp(Icons.home, "Option 2", () {
                  // Do something when Option 2 is pressed
                }),
                OptionPopUp(Icons.home, "Option 3", () {
                  // Do something when Option 3 is pressed
                }),
                OptionPopUp(Icons.home, "Option 4", () {
                  // Do something when Option 4 is pressed
                })
              ],
              graph: CustomPieChart(dataPie: [
                PieChartDataModel(
                  name: 'Apple',
                  value: 25.0,
                  color: Colors.red,
                ),
                PieChartDataModel(
                  name: 'Orange',
                  value: 15.0,
                  color: Colors.orange,
                ),
                PieChartDataModel(
                  name: 'Banana',
                  value: 10.0,
                  color: Colors.yellow,
                ),
                PieChartDataModel(
                  name: 'Grape',
                  value: 20.0,
                  color: Colors.purple,
                ),
                PieChartDataModel(
                  name: 'Watermelon',
                  value: 30.0,
                  color: Colors.green,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
