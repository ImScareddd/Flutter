import 'package:flutter/material.dart';
import 'package:untitled/constant/appDefault.dart';
import 'package:untitled/view/bottomNavigationBarPage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('Statistics'),
        leading: IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => BottomNavigationBarPage()),
                (route) => false),
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          children: [
            chart([5, 7, 6, 4, 6, 7, 9], [8, 4, 7, 7, 6, 9, 8]),
          ],
        ),
      ),
    );
  }

  Widget chart(List<int> scoreList, List<int> predictScoreList) {
    return SfCartesianChart(
      // Initialize category axis
      primaryXAxis: CategoryAxis(),
      legend: Legend(isVisible: true),
      series: <LineSeries<ChartData, String>>[
        LineSeries<ChartData, String>(
            name: '최근 일주일 간의 기분',
            // Bind data source
            dataSource: <ChartData>[
              ChartData('Sun', scoreList[0]),
              ChartData('Mon', scoreList[1]),
              ChartData('Tue', scoreList[2]),
              ChartData('Wed', scoreList[3]),
              ChartData('Thu', scoreList[4]),
              ChartData('Fri', scoreList[5]),
              ChartData('Sat', scoreList[6]),
            ],
            xValueMapper: (ChartData sales, _) => sales.day,
            yValueMapper: (ChartData sales, _) => sales.score),
        LineSeries<ChartData, String>(
            name: '앞으로의 기분 예측',
            // Bind data source
            dataSource: <ChartData>[
              ChartData('Sun', predictScoreList[0]),
              ChartData('Mon', predictScoreList[1]),
              ChartData('Tue', predictScoreList[2]),
              ChartData('Wed', predictScoreList[3]),
              ChartData('Thu', predictScoreList[4]),
              ChartData('Fri', predictScoreList[5]),
              ChartData('Sat', predictScoreList[6]),
            ],
            xValueMapper: (ChartData chart, _) => chart.day,
            yValueMapper: (ChartData chart, _) => chart.score),
      ],
    );
  }
}

class ChartData {
  ChartData(this.day, this.score);
  final String day;
  final int score;
}
