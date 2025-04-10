import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class GiftStorePage extends StatefulWidget {
  const GiftStorePage({super.key});

  @override
  State<GiftStorePage> createState() => _GiftStorePageState();
}

class _GiftStorePageState extends State<GiftStorePage> {
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
