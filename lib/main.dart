import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/Screens/dashboard.dart';
import 'package:flutter_task/Screens/login.dart';
import 'package:flutter_task/Screens/practice.dart';

void main() {
  // Code for only potrait mode
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter_assignment",
        home: login());
  }
}
