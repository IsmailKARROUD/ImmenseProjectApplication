import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';

class CustomDirectSelect extends StatefulWidget {
  CustomDirectSelect({
    Key? key,
    required this.elements,
    this.actions = const [],
    required this.selectedIndex,
    required this.onSelectedItemChanged,
  }) : super(key: key);

  final List<String> elements;
  final List<Widget> actions;
  int selectedIndex;
  final void Function(int?) onSelectedItemChanged;

  @override
  State<CustomDirectSelect> createState() => _CustomDirectSelectState();
}

class _CustomDirectSelectState extends State<CustomDirectSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DirectSelect(
        itemExtent: 35.0,
        selectedIndex: widget.selectedIndex,
        onSelectedItemChanged: widget.onSelectedItemChanged,
        mode: DirectSelectMode.tap,
        items: widget.elements.map((val) => _buildItem(context, val)).toList(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildItem(context, widget.elements[widget.selectedIndex]),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.actions,
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title) {
    return Center(
      //fittedBox in order the text to fit the available space
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
