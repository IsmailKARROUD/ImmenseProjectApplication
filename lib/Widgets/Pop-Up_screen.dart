import 'package:flutter/material.dart';

class OptionPopUp {
  String title;
  IconData icon;
  VoidCallback? onPressed;
  OptionPopUp(this.icon, this.title, this.onPressed);
}

Future<void> popUPScreen(
    BuildContext context, String title, List<OptionPopUp> listOfOptionPopUp) {
  final mQSize = MediaQuery.of(context).size;

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    constraints: BoxConstraints(maxHeight: mQSize.height * 0.6),
    builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  )),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.95),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("Clear"))
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: true,
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: listOfOptionPopUp.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                listOfOptionPopUp[index].icon,
                size: 40,
              ),
              title: Text(
                listOfOptionPopUp[index].title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              onTap: listOfOptionPopUp[index].onPressed,
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ),
        ],
      );
    },
  );
}
