import 'package:flutter/material.dart';
import 'package:untitled/constant/appDefault.dart';
import 'package:untitled/testPage.dart';
import 'package:untitled/view/loginPage.dart';
import 'package:untitled/view/statisticsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppDefault(MediaQuery.of(context).size);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '날랑말랑',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      // home: const TestPage(),
    );
  }
}
