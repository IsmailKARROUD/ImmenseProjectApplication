import 'package:flutter/material.dart';
import 'package:imense/PrincipalPages/Overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            //TODO:check color
            color: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
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
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.business),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.school),
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
          onPressed: () {
            // Add your code here to handle the onPressed event
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
