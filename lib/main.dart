import 'package:flutter/material.dart';
import 'package:tictac/board_screen.dart';
import 'package:tictac/home.dart';
//to try add edited file
void main() {
  runApp(const MyApp());
}
//try
class MyApp extends StatelessWidget {
  const MyApp({super.key});


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

