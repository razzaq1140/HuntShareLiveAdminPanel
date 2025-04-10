import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;
  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if(screenWidth < 600){
          return mobileLayout;
        }else if(screenWidth < 1024){
          return tabletLayout;
        }else{
          return desktopLayout;
        }
    },);
  }
}
