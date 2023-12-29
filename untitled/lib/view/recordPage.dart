import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:untitled/constant/appDefault.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  int num = 2;
  bool isPictureReceived = false;
  List<String> strList = [
    "2023.12.28 11시 35분",
    "진아 점심 약속",
    "2023.12.28 12시 46분",
    "나무톤 참석",
    "2023.12.28 13시 15분",
    "아 오늘 아이스 브레이킹을 하는데 가위바위보를 져서 발표를 하게 되었다. 진짜 이길 수 있었는데 아깝다. 그래도 발표 후에 아이스 브레이킹 한 부분은 다 기억해서 가산점을 받을 수 있었다."
  ];
  String src =
      "https://firebasestorage.googleapis.com/v0/b/flutter-dbcbd.appspot.com/o/KakaoTalk_Photo_2023-12-29-05-48-53.png?alt=media&token=b1d30f6a-fc44-40dd-a2bd-6747a11a9ce4";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(height: 20),
              isPictureReceived
                  ? Container(
                      width: AppDefault.width * 0.9,
                      height: AppDefault.width * 0.55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.gif',
                          image: src,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () => setState(() {
                        isPictureReceived = true;
                      }),
                      child: Stack(
                        children: [
                          Container(
                            width: AppDefault.width * 0.9,
                            height: AppDefault.width * 0.55,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: AppDefault.width * 0.45 - 25,
                                top: AppDefault.width * 0.275 - 25),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
              Container(height: 20),
              timeLine(),
              addRecordButton(),
              Container(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Record'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('일기를 기록해주세요.'),
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
                setState(() {
                  num++;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget addRecordButton() {
    return ElevatedButton(
      onPressed: () => _dialogBuilder(context),
      child: Icon(Icons.add),
      style: AppDefault.smallButton,
    );
  }

  Widget timeLine() {
    return Expanded(
      child: Timeline.tileBuilder(
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0.1,
          connectorTheme: ConnectorThemeData(color: AppDefault.mainColor),
          indicatorTheme: IndicatorThemeData(color: AppDefault.mainColor),
        ),
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.basic,
          contentsBuilder: (context, index) => timeLineListTile(index),
          itemCount: num,
        ),
      ),
    );
  }

  Widget timeLineListTile(int i) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strList[2 * i],
            style: AppDefault.smallBoldText,
          ),
          Text(strList[2 * i + 1]),
        ],
      ),
    );
  }

  Widget ex() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strList[0],
            style: TextStyle(
              fontFamily: 'Noto_Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 10),
          Text(strList[1]),
          Container(height: 10),
          Text(
            strList[2],
            style: TextStyle(
              fontFamily: 'Noto_Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 10),
          Text(strList[3]),
          Container(height: 10),
          Text(
            strList[4],
            style: TextStyle(
              fontFamily: 'Noto_Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 10),
          Text(strList[5]),
        ],
      ),
    );
  }
}
