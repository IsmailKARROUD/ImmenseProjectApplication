import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:imense/PrincipalPages/Overview.dart';
import 'package:imense/PrincipalPages/ManualAlert.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    final widthScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              //TODO:check color
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //using padding to give space to FloatingActionButton
                Padding(
                  padding: EdgeInsets.only(
                    left: widthScreen * 0.1,
                    right: widthScreen * 0.21,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      size: _selectedIndex == 0 ? 35 : 20,
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
                    size: _selectedIndex == 1 ? 35 : 20,
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
                    size: _selectedIndex == 2 ? 35 : 20,
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
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ManualAlert())),
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
