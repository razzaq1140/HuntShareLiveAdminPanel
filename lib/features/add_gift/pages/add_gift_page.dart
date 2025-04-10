import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class AddGiftPage extends StatefulWidget {
  const AddGiftPage({super.key});

  @override
  State<AddGiftPage> createState() => _AddGiftPageState();
}

class _AddGiftPageState extends State<AddGiftPage> {
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
