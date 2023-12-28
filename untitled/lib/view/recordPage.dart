import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:untitled/constant/appDefault.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  List<String> strList = [
    "2023.12.28 11시 35분",
    "진아 점심 약속",
    "2023.12.28 12시 46분",
    "나무톤 참석",
    "2023.12.28 13시 15분",
    "아 오늘 아이스 브레이킹을 하는데 가위바위보를 져서 발표를 하게 되었다. 진짜 이길 수 있었는데 아깝다. 그래도 발표 후에 아이스 브레이킹 한 부분은 다 기억해서 가산점을 받을 수 있었다."
  ];
  String src =
      "https://mblogthumb-phinf.pstatic.net/MjAyMDA2MzBfMTc5/MDAxNTkzNDc1NTM1Mjk0.YlmNikHXs16erkjED8Y-3EeYGL3_dAEMNaduCVdfTK4g.jDt5YzFaXmZpJgbdruUWgfXLzXbu1gRcg_GBvFMWzSog.JPEG.aidedu/%EF%BB%BFPresentation(%ED%94%84%EB%A0%88%EC%A0%A0%ED%85%8C%EC%9D%B4%EC%85%98)_%EC%B2%AD%EC%A4%91%EC%9D%98_%EA%B8%8D%EC%A0%95%EC%A0%81%EC%9D%B8_%EB%B0%98%EC%9D%91%EC%9D%84_%EC%9D%B4%EB%81%8C%EC%96%B4_%EB%82%B4%EB%9D%BC_%ED%94%84%EB%A6%AC%EC%A0%A0%ED%85%8C%EC%9D%B4%EC%85%98,_PT,_%EB%B0%9C%ED%91%9C,_PPT,_%EC%A0%9C%EC%95%88%EC%84%9C,_%EC%A0%9C%EC%95%88%EC%84%A4%EB%AA%85%ED%9A%8C,_%EC%97%90.jpg?type=w800";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(height: 20),
              Container(
                width: AppDefault.width * 0.9,
                height: AppDefault.width * 0.55,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(src),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Container(height: 20),
              timeLine(),
            ],
          ),
        ),
      ),
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
          itemCount: 3,
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
