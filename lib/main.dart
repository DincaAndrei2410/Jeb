import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaib/screens/login.dart';
import 'package:jaib/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: HeadlineTextStyle,
            subtitle1: SubtitleTextStyle,
          )),
      home: const LoginPage(),
    );
  }
}
