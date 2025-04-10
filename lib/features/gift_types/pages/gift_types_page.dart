import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/common/constants/global_variables.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';

class GiftTypesPage extends StatefulWidget {
  const GiftTypesPage({super.key});

  @override
  State<GiftTypesPage> createState() => _GiftTypesPageState();
}

class _GiftTypesPageState extends State<GiftTypesPage> {
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
          backgroundColor: colorScheme(context).outlineVariant,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                color: colorScheme(context).onPrimary,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Text('Select Gift Type',style: textTheme(context).bodySmall?.copyWith(color: colorScheme(context).onSecondary, fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Row(
                      children: [

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
