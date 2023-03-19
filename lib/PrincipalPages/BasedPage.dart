import 'package:flutter/material.dart';
import 'package:imense/PrincipalPages/Overview.dart';
import 'package:imense/PrincipalPages/ManualAlert.dart';

class BasedPage extends StatefulWidget {
  const BasedPage({super.key});

  @override
  State<BasedPage> createState() => _BasedPageState();
}

class _BasedPageState extends State<BasedPage> {
  //start with the first page
  int _selectedIndex = 0;

  //All pages in bottom bar to be chosen by user
  final List<Widget> _widgetOptions = <Widget>[
    const Overview(),
    const Center(child: Text('Page 2')),
    const Center(child: Text('Page 3')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //using padding to give space to FloatingActionButton
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 100),
                child: IconButton(
                  icon: Icon(
                    Icons.home,
                    size: _selectedIndex == 0 ? 35 : 25,
                    color: _selectedIndex == 0 ? Colors.blue : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.business,
                  size: _selectedIndex == 1 ? 35 : 25,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.school,
                  size: _selectedIndex == 2 ? 35 : 25,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ManualAlert())),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
