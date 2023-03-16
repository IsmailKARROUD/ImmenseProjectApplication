import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Stats(),
        ],
      ),
    );
  }
}
