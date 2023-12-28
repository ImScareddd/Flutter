import 'package:flutter/material.dart';
import 'package:untitled/constant/appDefault.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> strList = [
    "오늘 점심을 누구랑 먹었어?",
    "오늘 뭐를 져서 발표를 하게 되었어?",
    "오늘 몇시에 말과글 발표를 진행했어?"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: quizTitle(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 25),
              Text(
                strList[0],
                style: AppDefault.smallText,
              ),
              Container(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // 외곽선을 가진 스타일
                  labelText: 'Enter your answer', // 레이블 텍스트
                ),
                obscureText: false, // 비밀번호 입력란처럼 텍스트를 숨김
              ),
              Container(height: 10),
              Text(
                strList[1],
                style: AppDefault.smallText,
              ),
              Container(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // 외곽선을 가진 스타일
                  labelText: 'Enter your answer', // 레이블 텍스트
                ),
                obscureText: false, // 비밀번호 입력란처럼 텍스트를 숨김
              ),
              Container(height: 10),
              Text(
                strList[2],
                style: AppDefault.smallText,
              ),
              Container(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(), // 외곽선을 가진 스타일
                  labelText: 'Enter your answer', // 레이블 텍스트
                ),
                obscureText: false, // 비밀번호 입력란처럼 텍스트를 숨김
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quizTitle() {
    return Text('Quiz', style: AppDefault.titleText);
  }
}
