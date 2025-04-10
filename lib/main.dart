import 'package:flutter/material.dart';
import 'package:hunt_share_live_admin_panel/features/dashboard/provider/dashboard_provider.dart';
import 'package:hunt_share_live_admin_panel/routes/go_route.dart';
import 'package:hunt_share_live_admin_panel/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => DashboardProvider(),),
    ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.lightTheme(context),
        routeInformationParser: MyAppRouter.router.routeInformationParser,
        routeInformationProvider: MyAppRouter.router.routeInformationProvider,
        routerDelegate: MyAppRouter.router.routerDelegate,
      ),
    );
  }
}

