import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/onboard.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
  ),);
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp()

  );
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Food',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        fontFamily: "Lato",
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardScreen(),
    );
  }
}


