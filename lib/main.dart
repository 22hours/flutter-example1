// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_example/state/app_controller.dart';
import 'package:flutter_example/state/app_list.dart';
import 'package:flutter_example/statless/dismiss_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'JH APP',
            theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.blue[400],
                dividerColor: Color.fromRGBO(240, 240, 240, 1),
                textTheme: const TextTheme(
                    headline1: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    bodyText1:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    bodyText2:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                    caption: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(150, 150, 150, 1)
                        // color: Theme.of(context).primaryColor
                        ))),
            // home: InstallAppList()
            home: Scaffold(
              appBar: AppBar(
                title: Text("MYAPPSS"),
              ),
              body: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: <Widget>[Text(''), InstallAppList()],
              ),
            )));
  }
}
