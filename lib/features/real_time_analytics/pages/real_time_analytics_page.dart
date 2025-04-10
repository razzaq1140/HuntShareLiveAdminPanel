import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class RealTimeAnalyticsPage extends StatefulWidget {
  const RealTimeAnalyticsPage({super.key});

  @override
  State<RealTimeAnalyticsPage> createState() => _RealTimeAnalyticsPageState();
}

class _RealTimeAnalyticsPageState extends State<RealTimeAnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: Scaffold(
          body: Column(
            children: [

            ],
          ),
        ),
        tabletLayout: Scaffold(
          body: Column(
            children: [

            ],
          ),
        ),
        desktopLayout: Scaffold(
          body: Column(
            children: [

            ],
          ),
        )
    );
  }
}
