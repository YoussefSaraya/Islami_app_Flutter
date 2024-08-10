import 'package:flutter/material.dart';
import 'package:islami/Home/home_screen.dart';
import 'package:islami/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        theme: MyThemeData.lightTheme,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
        });
  }
}
