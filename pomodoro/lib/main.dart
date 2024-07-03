import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_screens.dart';

void main() {
  runApp(App());
}

////////////////////////////////////////////////////////

class App extends StatelessWidget {// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(

          backgroundColor: const Color(0xFFE7626C),),
        textTheme: const TextTheme(displayLarge: TextStyle(color: Color(0xFF232B55),),),
        cardColor: const Color(0xFFF4EDDB),),

      home: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }

}
