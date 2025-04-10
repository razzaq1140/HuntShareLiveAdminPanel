import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class TotalEventPage extends StatefulWidget {
  const TotalEventPage({super.key});

  @override
  State<TotalEventPage> createState() => _TotalEventPageState();
}

class _TotalEventPageState extends State<TotalEventPage> {
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
