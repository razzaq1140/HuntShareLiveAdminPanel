import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class AddGamePage extends StatefulWidget {
  const AddGamePage({super.key});

  @override
  State<AddGamePage> createState() => _AddGamePageState();
}

class _AddGamePageState extends State<AddGamePage> {
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
