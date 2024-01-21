import 'package:flutter/material.dart';
import 'package:test_assignment_to_n_company/screens/first_screen/presentation.dart';
import 'package:test_assignment_to_n_company/screens/second_screen/presentation.dart';
import 'package:test_assignment_to_n_company/screens/third_screen/presentation.dart';
import 'package:test_assignment_to_n_company/screens/fourth_screen/presentation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstScreen(),
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
      ),
      initialRoute: '/first',
      routes: {
        '/first': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
        '/third': (context) => const ThirdScreen(),
        '/fourth': (context) => const FourthScreen(),
      },
    );
  }
}
