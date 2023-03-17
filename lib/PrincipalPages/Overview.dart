import 'package:flutter/material.dart';
import 'package:imense/Widgets/Pop-Up_screen.dart';
import 'package:imense/Widgets/statistics.dart';
import 'package:imense/Widgets/stats.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
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
            Stats(),
            Statistics(
              title: 'My observations',
              subtitle: 'Statistics',
              graph: const Text("data"),
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
            const Statistics(
              title: 'My observations',
              subtitle: 'Statistics',
              graph: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
