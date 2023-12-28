import 'package:flutter/material.dart';
import 'package:untitled/constant/appDefault.dart';
import 'package:untitled/view/calendarPage.dart';
import 'package:untitled/view/quizPage.dart';
import 'package:untitled/view/recordPage.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int currentPageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: const Color(0xfffafafa),
          indicatorColor: AppDefault.mainColor,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.note_alt),
              label: '',
            ),
            NavigationDestination(
              // selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.messenger_sharp),
              label: '',
            ),
          ],
        ),
        body: <Widget>[
          const RecordPage(),
          const CalendarPage(),
          const QuizPage(),
        ][currentPageIndex],
      ),
    );
  }
}
