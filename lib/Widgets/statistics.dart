import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:imense/Widgets/Pop-Up_screen.dart';

class Statistics extends StatefulWidget {
  const Statistics({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.graph,
    this.listofFilters = const [],
    this.options,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget graph;
  final List<String> listofFilters;
  final List<OptionPopUp>? options;

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.listofFilters.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.listofFilters[index]),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                        ))
                  ],
                ),
              );
            },
          ),
        ),
        Card(
          child: ListTile(
            title: Text(widget.title),
            subtitle: Text(widget.subtitle),
            trailing: widget.options == null
                ? null
                : IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () async {
                      return popUPScreen(context, "Filter by", widget.options!);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
