import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class AppDefault {
  static Color mainColor = const Color(0xFF5db075);
  static double width = 0;
  static double height = 0;

  AppDefault(Size size) {
    width = size.width;
    height = size.height;
  }

  //for title text
  static TextStyle titleText = const TextStyle(
    fontSize: 45,
    fontFamily: 'Noto_Sans',
    fontWeight: FontWeight.bold,
  );

  //for mid text
  static TextStyle midText = const TextStyle(
    fontSize: 30,
    fontFamily: 'Noto_Sans',
    fontWeight: FontWeight.bold,
  );

  //for small text
  static TextStyle smallText = const TextStyle(
    fontSize: 15,
    fontFamily: 'Noto_Sans',
    fontWeight: FontWeight.normal,
  );

  //for small text
  static TextStyle smallBoldText = const TextStyle(
    fontSize: 15,
    fontFamily: 'Noto_Sans',
    fontWeight: FontWeight.bold,
  );

  //for Single day font title text
  static TextStyle titleSDText = const TextStyle(
    fontSize: 45,
    fontFamily: 'Single_Day',
    fontWeight: FontWeight.bold,
  );

  //for Single day font mid text
  static TextStyle midSDText = const TextStyle(
    fontSize: 30,
    fontFamily: 'Single_Day',
    fontWeight: FontWeight.bold,
  );

  //for Single day font small text
  static TextStyle smallSDText = const TextStyle(
    fontSize: 18,
    fontFamily: 'Single_Day',
    fontWeight: FontWeight.normal,
  );

  //for Single day font small text
  static TextStyle smallBoldSDText = const TextStyle(
    fontSize: 18,
    fontFamily: 'Single_Day',
    fontWeight: FontWeight.bold,
  );

  //for Noto_Sans_KR title text
  static TextStyle titleKRText = const TextStyle(
    fontSize: 45,
    fontFamily: 'Noto_Sans_KR',
    fontWeight: FontWeight.bold,
  );

  //for Noto_Sans_KR mid text
  static TextStyle midKRText = const TextStyle(
    fontSize: 30,
    fontFamily: 'Noto_Sans_KR',
    fontWeight: FontWeight.bold,
  );

  //for Noto_Sans_KR small text
  static TextStyle smallKRText = const TextStyle(
    fontSize: 15,
    fontFamily: 'Noto_Sans_KR',
    fontWeight: FontWeight.bold,
  );

  //for big button like login button
  static ButtonStyle bigButton = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        // side: BorderSide(color: Colors.black),
      ),
    ),
  );

  //for small button
  static ButtonStyle smallButton = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        // side: BorderSide(color: Colors.black),
      ),
    ),
  );

  // for default snackbar
  static SnackBar snackBar(String message) {
    return SnackBar(
      shape: RoundedRectangleBorder(
        // side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(4.0),
      ),
      content: Text(message),
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
    );
  }

  //for calendar header
  static HeaderStyle headerStyle = HeaderStyle(
    headerPadding: const EdgeInsets.only(top: 37, bottom: 10),
    titleTextFormatter: (date, locale) => DateFormat.MMMM(locale).format(date),
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: Color(0xFF5db075), width: 5),
        bottom: BorderSide(color: Color(0xFF5db075), width: 5),
      ),
      color: Color(0xFF5db075),
    ),
    // headerMargin: const EdgeInsets.only(bottom: 8.0),
    titleCentered: true,
    leftChevronVisible: false,
    rightChevronVisible: false,
    titleTextStyle: const TextStyle(
      fontSize: 30,
      fontFamily: 'Noto_Sans',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}
