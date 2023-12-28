import 'package:flutter/material.dart';

import 'constant/appDefault.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          exMidText(),
          exSmallText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              exSmallButton(context),
              Container(
                width: 20,
              ),
              exSmallButton(context)
            ],
          ),
        ],
      ),
    );
  }

  Widget exMidText() {
    return Text(
      "NAMU NAMU NAMU",
      style: AppDefault.midText,
    );
  }

  Widget exSmallText() {
    return Text(
      "NAMU NAMU NAMU",
      style: AppDefault.smallText,
    );
  }

  Widget exSmallButton(context) {
    return SizedBox(
      width: AppDefault.width * 0.15,
      height: AppDefault.width * 0.15,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(AppDefault.snackBar('NAMUNAMUNAMU'));
        },
        style: AppDefault.smallButton,
        child: const Icon(Icons.add),
      ),
    );
  }
}
