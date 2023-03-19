import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  SizedBox customCard(
      IconData icon, Color backgroundColorIcon, int number, String subtitle) {
    //to allow ListTile to expand in the available space
    return SizedBox(
      width: 230,
      child: Card(
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundColor: backgroundColorIcon,
              child: Icon(
                icon,
              ),
            ),
          ),
          title: Text(number.toString()),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          customCard(Icons.pause, Colors.blue, 150, "My observations"),
          customCard(Icons.home, Colors.blue, 4, "Pending"),
          customCard(Icons.timelapse, Colors.yellow, 1, "Progress"),
          customCard(Icons.done, Colors.greenAccent, 2, "Resolved"),
          customCard(Icons.close_rounded, Colors.grey, 1, "Closed"),
        ],
      ),
    );
  }
}
