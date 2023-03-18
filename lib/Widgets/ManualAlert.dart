import 'package:direct_select/direct_select.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imense/Widgets/customDirectSelect.dart';

class ManualAlert extends StatefulWidget {
  const ManualAlert({Key? key}) : super(key: key);

  @override
  _ManualAlertState createState() => _ManualAlertState();
}

class _ManualAlertState extends State<ManualAlert> {
  final _formKey = GlobalKey<FormState>();

  bool? _inOrOutside;
  bool? _roOrEq;
  int? _level;
  String? _roomName;
  String? _equipementName;
  Duration? _timeOfJob;
  int _selectedIndexTime = 0;
  int _selectedIndexSite = 0;
  int _selectedIndexZone = 0;
  bool _siteBookMark = false;
  bool _zoneBookMark = false;
  bool _toAddCustomRoom = false;

  Widget _customTiltle(String title, {Widget? action}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (action != null) action
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Examples
    final List<String> siteListExample = [
      for (var i = 1; i <= 10; i++) 'Site ${i.toString().padLeft(3, "0")}'
    ];
    final List<String> zoonListExample = [
      for (var i = 991; i <= 1000; i++) 'Site ${i.toString().padLeft(3, "0")}'
    ];
    final List<String> timeListExample = [
      for (var i = 5; i <= 60; i = i + 5) '$i Minutes'
    ];
    final List<String> roomListExample = [
      for (double i = 1.01; i <= 1.1; i = i + 0.01)
        'room ${i.toStringAsFixed(2)}'
    ];
    final List<String> equipementListExample = [
      for (double i = 1.01; i <= 1.1; i = i + 0.01)
        'Equipement ${i.toStringAsFixed(2)}'
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manual Alert"),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.undo),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _customTiltle('Site',
                  action: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info_outline))),
              CustomDirectSelect(
                elements: siteListExample,
                selectedIndex: _selectedIndexSite,
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _siteBookMark = !_siteBookMark;
                        });
                      },
                      icon: Icon(Icons.bookmark,
                          color: _siteBookMark ? Colors.yellow : Colors.grey))
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedIndexSite = value!;
                  });
                },
              ),
              _customTiltle('Zone',
                  action: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.info_outline))),
              CustomDirectSelect(
                elements: zoonListExample,
                selectedIndex: _selectedIndexZone,
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _zoneBookMark = !_zoneBookMark;
                        });
                      },
                      icon: Icon(
                        Icons.bookmark,
                        color: _zoneBookMark ? Colors.yellow : Colors.grey,
                      ))
                ],
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedIndexZone = value!;
                  });
                },
              ),
              _customTiltle(
                'Level',
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(13, (int index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: index - 2 == _level
                                            ? MaterialStateProperty.all<Color>(
                                                Colors.black)
                                            : null),
                                    onPressed: () {
                                      setState(() {
                                        _level = index - 2;
                                      });
                                    },
                                    child: Text("${index - 2}")),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              _customTiltle(
                'Location',
              ),
              CupertinoSegmentedControl(
                  padding: const EdgeInsets.all(10),
                  groupValue: _roOrEq,
                  children: const {
                    true: Text("Room"),
                    false: Text("Equipement"),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _roOrEq = value;
                    });
                  }),
              if (_roOrEq != null)
                Column(
                  children: [
                    _customTiltle(_roOrEq! ? 'Room' : 'Equipement',
                        action: TextButton(
                            onPressed: () {
                              setState(() {
                                _toAddCustomRoom = !_toAddCustomRoom;
                              });
                            },
                            child:
                                Text(_toAddCustomRoom ? "choose" : "+ add"))),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 250),
                      crossFadeState: _toAddCustomRoom
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          labelText: 'Enter a new ...',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a value';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      secondChild: CustomDirectSelect(
                        elements:
                            _roOrEq! ? roomListExample : equipementListExample,
                        selectedIndex: _selectedIndexSite,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            _selectedIndexSite = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              _customTiltle(
                'Position',
              ),
              CupertinoSegmentedControl(
                  padding: const EdgeInsets.all(10),
                  groupValue: _inOrOutside,
                  children: const {
                    true: Text("Inside"),
                    false: Text("Outside"),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      _inOrOutside = value;
                    });
                  }),
              _customTiltle(
                'Time expected to complete the job',
              ),
              CustomDirectSelect(
                elements: timeListExample,
                selectedIndex: _selectedIndexTime,
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedIndexTime = value!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Do something with the form data
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.send),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Send Alert'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
