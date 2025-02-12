import 'package:flutter/material.dart';
import 'package:tictac/board_screen.dart';
import 'package:tictac/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName:(context)=>Home(),
        BoardScreen.routeName:(context)=>BoardScreen(),
      },
      initialRoute: Home.routeName,
    );
  }
}

