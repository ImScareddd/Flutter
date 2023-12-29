import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/constant/appDefault.dart';
import 'package:untitled/controller/loginDataController.dart';
import 'package:untitled/controller/toDoListController.dart';
import 'package:untitled/data/model/toDoListNode.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    Get.put(ToDoListController());
    Get.find<ToDoListController>()
        .setToDoListNodeList(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            calendar(),
            GetBuilder<ToDoListController>(
              builder: (controller) => todoList(controller),
            )
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
        Get.find<ToDoListController>()
            .setToDoListNodeList(DateFormat('yyyy-MM-dd').format(selectedDay));
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

  Widget todoList(ToDoListController controller) {
    int itemCount = controller.toDoList.length + 1;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (c, i) => i == itemCount - 1
            ? plusButton(controller)
            : todoListTile(i, controller),
        itemCount: itemCount,
      ),
    );
  }

  Widget todoListTile(int i, ToDoListController controller) {
    return Column(
      children: [
        ListTile(
          leading: IconButton(
            onPressed: () {
              controller.setToDoListNodeBool(
                  i,
                  _selectedDay == null
                      ? DateFormat('yyyy-MM-dd').format(_focusedDay)
                      : DateFormat('yyyy-MM-dd').format(_selectedDay!),
                  controller.toDoList[i].todo,
                  DateTime.now().toString());
              // setState(() {});
            },
            icon: Icon(Icons.circle),
            color: controller.toDoList[i].isFinished
                ? Color(0xFF5db075)
                : Color(0xFFBDBDBD),
          ),
          title: Text(
            controller.toDoList[i].todo,
            style: AppDefault.smallBoldText,
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget plusButton(ToDoListController controller) {
    return Column(
      children: [
        ListTile(
          title: const Icon(
            Icons.add,
            size: 40,
          ),
          onTap: () => onPlusButtonTap(controller),
        ),
        const Divider(),
        const ListTile(),
      ],
    );
  }

  void onPlusButtonTap(ToDoListController controller) {
    _dialogBuilder(context, controller);
  }

  Future<void> _dialogBuilder(
      BuildContext context, ToDoListController controller) {
    TextEditingController textEditingController = TextEditingController();
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
              TextField(controller: textEditingController),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('확인'),
              onPressed: () {
                controller.addToDoListNode(
                    _selectedDay == null
                        ? DateFormat('yyyy-MM-dd').format(_focusedDay)
                        : DateFormat('yyyy-MM-dd').format(_selectedDay!),
                    textEditingController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
