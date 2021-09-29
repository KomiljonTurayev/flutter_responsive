import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    Widget homeBody = isPortrait
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: _isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
              Container(
                height: size.height * 0.5,
                color: Colors.amberAccent,
                margin: const EdgeInsets.all(20.0),
              ),
              Container(
                height: size.height * 0.1,
                color: Colors.amberAccent,
                margin: const EdgeInsets.all(20.0),
              ),
            ],
          )
        : Container(
            child: Row(
              children: [
                Container(
                  width: 300,
                  color: Colors.red,
                  // margin: const EdgeInsets.all(20.0),
                ),
                Container(
                  width: 300,
                  color: Colors.purple,
                  // margin: const EdgeInsets.all(20.0),
                ),
              ],
            ),
          );

    Widget appBar = Platform.isIOS
        ? CupertinoNavigationBar()
        : AppBar(
            title: Text('App'),
          );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: homeBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: homeBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                  ),
          );
  }
}
