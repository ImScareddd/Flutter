import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/constant/appDefault.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> strList = ["나무톤 참석", "인프런 머신러닝 섹션 6수강", "진아 점심 약속", "말과글 발표"];
  List<bool> boolList = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            calendar(),
            todoList(3),
          ],
        ),
      ),
    );
  }

  Widget calendar() {
    return TableCalendar(
      headerStyle: AppDefault.headerStyle,
      daysOfWeekHeight: 40,
      daysOfWeekStyle: const DaysOfWeekStyle(
        decoration: BoxDecoration(
            boxShadow: null,
            shape: BoxShape.rectangle,
            color: Color(0xFF5db075),
            border: Border(
              top: BorderSide(color: Color(0xFF5db075), width: 10),
            )),
        weekdayStyle: TextStyle(color: Colors.white),
        weekendStyle: TextStyle(color: Colors.white),
      ),
      firstDay: DateTime.utc(2020, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        print("selected date: " + selectedDay.toString());
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  Widget todoList(int _itemCount) {
    int itemCount = _itemCount + 1;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (c, i) =>
            i == itemCount - 1 ? plusButton() : todoListTile(i),
        itemCount: itemCount,
      ),
    );
  }

  Widget todoListTile(int i) {
    return Column(
      children: [
        ListTile(
          leading: IconButton(
            onPressed: () {
              setState(() {
                boolList[i] = !boolList[i];
              });
            },
            icon: Icon(Icons.circle),
            color: boolList[i] ? Color(0xFF5db075) : Color(0xFFBDBDBD),
          ),
          title: Text(
            strList[i],
            style: AppDefault.smallBoldText,
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget plusButton() {
    return Column(
      children: [
        ListTile(
          title: const Icon(
            Icons.add,
            size: 40,
          ),
          onTap: () => onPlusButtonTap(),
        ),
        const Divider(),
        const ListTile(),
      ],
    );
  }

  void onPlusButtonTap() {
    _dialogBuilder(context);
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('TODO'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('오늘의 할 일을 입력해주세요.'),
              TextField(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
