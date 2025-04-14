/*
import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CreatorInsightPage extends StatefulWidget {
  const CreatorInsightPage({super.key});

  @override
  State<CreatorInsightPage> createState() => _CreatorInsightPageState();
}

class _CreatorInsightPageState extends State<CreatorInsightPage> {
  final List<ChartData> chartData = [
    ChartData('Jan', 1500, 200, 400, 150, 50),
    ChartData('Feb', 1800, 300, 450, 200, 60),
    ChartData('Mar', 2100, 350, 500, 220, 70),
    ChartData('Apr', 2500, 400, 600, 300, 90),
    ChartData('May', 3000, 450, 750, 350, 100),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: Scaffold(
        appBar: AppBar(title: Text('Profile & Creator Insights')),
        body: SfCartesianChart(
          legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
              name: 'Followers',
              color: Colors.green,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.followers,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Earnings (\$)',
              color: Colors.orange,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.earnings,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Likes',
              color: Colors.blue,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.likes,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Comments',
              color: Colors.pink,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.comments,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Shares',
              color: Colors.purple,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.shares,
            ),
          ],
        ),
      ),
      tabletLayout: Scaffold(
        appBar: AppBar(title: Text('Profile & Creator Insights')),
        body: SfCartesianChart(
          legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
              name: 'Followers',
              color: Colors.green,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.followers,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Earnings (\$)',
              color: Colors.orange,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.earnings,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Likes',
              color: Colors.blue,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.likes,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Comments',
              color: Colors.pink,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.comments,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Shares',
              color: Colors.purple,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.shares,
            ),
          ],
        ),
      ),
      desktopLayout: Scaffold(
        appBar: AppBar(title: Text('Profile & Creator Insights')),
        body: SfCartesianChart(
          legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries>[
            ColumnSeries<ChartData, String>(
              name: 'Followers',
              color: Colors.green,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.followers,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Earnings (\$)',
              color: Colors.orange,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.earnings,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Likes',
              color: Colors.blue,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.likes,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Comments',
              color: Colors.pink,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.comments,
            ),
            ColumnSeries<ChartData, String>(
              name: 'Shares',
              color: Colors.purple,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.shares,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String month;
  final double followers;
  final double earnings;
  final double likes;
  final double comments;
  final double shares;

  ChartData(this.month, this.followers, this.earnings, this.likes,
      this.comments, this.shares);
}
*/
