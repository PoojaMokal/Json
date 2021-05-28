import 'package:demoapp/homePage_with_sb.dart';
import 'package:demoapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homePage.dart';
import 'homePage_with_futurebuilder.dart';
import 'loginPage.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs=await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        accentColor: Colors.pink,
      ),
      home: Constants.prefs.getBool("LoggedIn")==true?HomePageFB():LoginPage(),
      routes:{
        LoginPage.routeName:(context)=>LoginPage(),
        HomePage.routeName:(context)=>HomePageFB(),
      } ,
    );
  }
}