import 'package:flutter/material.dart';
import 'package:untitled/constant/appDefault.dart';
import 'package:untitled/view/statisticsPage.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = -1;
  List<TextEditingController> textEditingControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<String> strList = [
    "오늘 점심을 누구랑 먹었어?",
    "오늘 뭐를 져서 발표를 하게 되었어?",
    "오늘 몇시에 말과글 발표를 진행했어?"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: quizTitle(),
        centerTitle: true,
        backgroundColor: AppDefault.mainColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(height: 40),
                  index == -1 ? quizStartMent() : quizListTile(index)
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  index == 2 ? submitButton() : nextButton(index),
                  Container(height: AppDefault.height * 0.2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget quizTitle() {
    return const Text('Quiz',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Noto_Sans',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }

  Widget quizListTileBuilder(int n) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (c, i) => quizListTile(i),
      itemCount: n,
    );
  }

  Widget quizStartMent() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "오늘의 기록들을 바탕으로 문제를 생성합니다.",
        textAlign: TextAlign.center,
        style: AppDefault.midText,
      ),
    );
  }

  Widget quizListTile(int i) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strList[i],
            // textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: 'Noto_Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 30),
          TextField(
            controller: textEditingControllerList[i],
            decoration: const InputDecoration(
              border: OutlineInputBorder(), // 외곽선을 가진 스타일
              labelText: 'Enter your answer', // 레이블 텍스트
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: AppDefault.width * 0.9,
      child: InkWell(
        onTap: () => onSubmitButtonPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Submit',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Noto_Sans',
                  fontWeight: FontWeight.bold,
                  color: AppDefault.mainColor,
                )),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 40,
              color: AppDefault.mainColor,
            )
          ],
        ),
      ),
    );
  }

  Widget nextButton(int i) {
    return SizedBox(
      width: AppDefault.width * 0.9,
      child: InkWell(
        onTap: () => setState(() {
          index += 1;
        }),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(i == -1 ? 'Start' : 'Next',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Noto_Sans',
                  fontWeight: FontWeight.bold,
                  color: AppDefault.mainColor,
                )),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 40,
              color: AppDefault.mainColor,
            )
          ],
        ),
      ),
    );
  }

  void onSubmitButtonPressed() {
    print(textEditingControllerList[0].text);
    print(textEditingControllerList[1].text);
    print(textEditingControllerList[2].text);
    _showMyDialog(98);
  }

  Future<void> _showMyDialog(int score) async {
    double _currentSliderValue = 5;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, _setState) => AlertDialog(
            title: const Text('퀴즈를 제출했습니다.'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const Text('오늘의 퀴즈를 모두 푸셨습니다.'),
                  Text('당신의 점수는 ${score}점 입니다.'),
                  const Text('오늘의 기분을 점수로 표현해주세요.'),
                  Container(height: 20),
                  Slider(
                    value: _currentSliderValue,
                    max: 10,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      _setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            actionsPadding: const EdgeInsets.only(bottom: 8, right: 16),
            actions: <Widget>[
              TextButton(
                child: const Text('통계보기'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StatisticsPage()));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
