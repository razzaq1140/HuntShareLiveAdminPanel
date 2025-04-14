import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hunt_share_live_admin_panel/common/constants/app_images.dart';
import 'package:hunt_share_live_admin_panel/common/constants/global_variables.dart';
import 'package:hunt_share_live_admin_panel/common/widgets/custom_textfield.dart';
import 'package:hunt_share_live_admin_panel/features/add_event/pages/add_event_page.dart';
import 'package:hunt_share_live_admin_panel/features/add_game/pages/add_game_page.dart';
import 'package:hunt_share_live_admin_panel/features/add_gift/pages/add_gift_page.dart';
import 'package:hunt_share_live_admin_panel/features/dashboard/provider/dashboard_provider.dart';
import 'package:hunt_share_live_admin_panel/features/gift_store/pages/gift_store_page.dart';
import 'package:hunt_share_live_admin_panel/features/gift_types/pages/gift_types_page.dart';
import 'package:hunt_share_live_admin_panel/features/home/pages/home_page.dart';
import 'package:hunt_share_live_admin_panel/features/logout/pages/logout_page.dart';
import 'package:hunt_share_live_admin_panel/features/payment_method/pages/payment_page.dart';
import 'package:hunt_share_live_admin_panel/features/real_time_analytics/pages/real_time_analytics_page.dart';
import 'package:hunt_share_live_admin_panel/features/responsive_layout/responsive_layout.dart';
import 'package:hunt_share_live_admin_panel/features/total_event/pages/total_event_page.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _mobileScaffoldKey =
      GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _tabletScaffoldKey =
      GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const HomePage(),
    RealTimeAnalyticsPage(),
    AddGiftPage(),
    /*CreatorInsightPage(),*/
    GiftTypesPage(),
    AddGiftPage(),
    GiftStorePage(),
    AddEventPage(),
    TotalEventPage(),
    AddGamePage(),
    PaymentMethodPage(),
    LogoutPage(),
  ];
  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'All User';
      case 1:
        return 'Real Time Analytics';
      case 2:
        return 'Creator Insight';
      case 3:
        return 'Gift Types';
      case 4:
        return 'Add Gift';
      case 5:
        return 'Gift Store';
      case 6:
        return 'Add Event';
      case 7:
        return 'Total Event';
      case 8:
        return 'Add Game';
      case 9:
        return 'Payment Method';
      case 10:
        return 'Logout';
      default:
        return 'Dashboard';
    }
  }

  static Widget _buildScreen(
      String text, Color bgColor, Color textColor, double fontSize) {
    return Container(
      color: bgColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ResponsiveLayout(
      desktopLayout: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).onSecondary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: 70,
                          //   width: 70,
                          //   child: SvgPicture.asset(
                          //     AppIcons.drawerLogo,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          const SizedBox(width: 10),
                          Text(
                            "Admin Dashboard",
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          const SizedBox(height: 10),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 0
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.dashboardIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 0
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'All User',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 0
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(0);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 1
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.storeIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 1
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Real Time Analytics',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 1
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(1);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 2
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.storeIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 2
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Creator Insight',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 2
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(2);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 3
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.customerIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 3
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Gift Types',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 3
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(3);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 4
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.promotionsIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 4
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Add Gift',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 4
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(4);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 5
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.usersqueriesIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 5
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Gift Store',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 5
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(5);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 6
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.analyticsdIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 6
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Add Event',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 6
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(6);
                                },
                              );
                            },
                          ),
                          SizedBox(width: height * 0.1),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 7
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.settingsIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 7
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Total Event',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 7
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(7);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 8
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.logoutIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 8
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Add Game',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 8
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(8);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 9
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.logoutIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 9
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Payment Method',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color: provider.selectedIndex == 9
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(9);
                                },
                              );
                            },
                          ),
                          Consumer<DashboardProvider>(
                            builder: (context, provider, child) {
                              return ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: provider.selectedIndex == 10
                                        ? colorScheme(context).primary
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppIcons.logoutIcon,
                                        height: width * 0.013,
                                        colorFilter: ColorFilter.mode(
                                          provider.selectedIndex == 10
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context)
                                                  .outlineVariant,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Logout',
                                        style: textTheme(context)
                                            .labelMedium
                                            ?.copyWith(
                                              color:
                                                  provider.selectedIndex == 10
                                                      ? colorScheme(context)
                                                          .onPrimary
                                                      : colorScheme(context)
                                                          .outlineVariant,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.setSelectedIndex(10);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.11,
                    width: double.infinity,
                    color: colorScheme(context).onSecondary,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<DashboardProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  "Detailed information about your ${_getAppBarTitle(provider.selectedIndex)}",
                                  style: textTheme(context)
                                      .labelMedium
                                      ?.copyWith(
                                          color: colorScheme(context)
                                              .onPrimary
                                              .withOpacity(0.66),
                                          fontWeight: FontWeight.w400),
                                );
                              },
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          height: height * 0.08,
                          width: width * 0.25,
                          child: CustomTextFormField(
                            textStyle: textTheme(context).labelMedium?.copyWith(
                                color: colorScheme(context).onSurface),
                            hint: "Search anything...",
                            controller: searchController,
                            borderRadius: 30,
                          ),
                        ),
                        SizedBox(width: width * 0.015),
                        IconButton(
                            onPressed: () {},
                            icon: Badge(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 10),
                                backgroundColor: colorScheme(context).error,
                                child: Icon(
                                    color: colorScheme(context).onPrimary,
                                    size: width * 0.02,
                                    Icons.notifications_none))),
                        SizedBox(width: width * 0.015),
                        CircleAvatar(
                          backgroundColor: colorScheme(context).outline,
                          radius: width * 0.015,
                          child: Center(
                              child: Icon(
                            Icons.person,
                            size: width * 0.015,
                          )),
                        ),
                        SizedBox(width: width * 0.01),
                        InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(AppIcons.chevronDownIcon)),
                        SizedBox(width: width * 0.02),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<DashboardProvider>(
                      builder: (context, provider, child) {
                        return _screens[provider.selectedIndex];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      tabletLayout: Scaffold(
        key: _tabletScaffoldKey,
        drawer: Drawer(
          width: width * 0.4,
          child: Container(
            decoration: BoxDecoration(color: colorScheme(context).onPrimary),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 70,
                                width: 70,
                                child: SvgPicture.asset(
                                  AppIcons.drawerLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Go Shop",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              const SizedBox(height: 10),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 0
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.dashboardIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 0
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Dashboard',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              0
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(0);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 1
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.storeIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 1
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Store',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              1
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(1);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 2
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons
                                                .storeIcon, // Add Orders icon
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 2
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Orders',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              2
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(2);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 3
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.customerIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 3
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Customers',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              3
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(3);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 4
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.promotionsIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 4
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Promotions',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              4
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(4);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 5
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.usersqueriesIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 5
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'User Queries',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              5
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(5);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 6
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.analyticsdIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 6
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Analytics',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              6
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(6);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              SizedBox(width: height * 0.1),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 7
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.settingsIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 7
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Settings',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              7
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(7);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 8
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.logoutIcon,
                                            height: width * 0.017,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 8
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Logout',
                                            style: textTheme(context)
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              8
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(8);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.11,
              width: double.infinity,
              color: colorScheme(context).surface,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _tabletScaffoldKey.currentState!.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: colorScheme(context).onSurface,
                        size: width * 0.025,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<DashboardProvider>(
                        builder: (context, provider, child) {
                          return Text(
                            _getAppBarTitle(provider.selectedIndex),
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      Consumer<DashboardProvider>(
                        builder: (context, provider, child) {
                          return Text(
                            "Detailed information about your ${_getAppBarTitle(provider.selectedIndex)}",
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.66),
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.33,
                    child: CustomTextFormField(
                      textStyle: textTheme(context)
                          .labelLarge
                          ?.copyWith(color: colorScheme(context).onSurface),
                      hint: "Search anything...",
                      controller: searchController,
                      borderRadius: 30,
                    ),
                  ),
                  SizedBox(width: width * 0.015),
                  IconButton(
                      onPressed: () {},
                      icon: Badge(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          backgroundColor: colorScheme(context).error,
                          child: Icon(
                              color: colorScheme(context).outlineVariant,
                              size: width * 0.025,
                              Icons.notifications_none))),
                  SizedBox(width: width * 0.015),
                  CircleAvatar(
                    backgroundColor: colorScheme(context).outline,
                    radius: width * 0.02,
                    child: Center(
                        child: Icon(
                      Icons.person,
                      size: width * 0.02,
                    )),
                  ),
                  SizedBox(width: width * 0.01),
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(AppIcons.chevronDownIcon)),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
            Expanded(
              child: Consumer<DashboardProvider>(
                builder: (context, provider, child) {
                  return _screens[provider.selectedIndex];
                },
              ),
            ),
          ],
        ),
      ),
      mobileLayout: Scaffold(
        key: _mobileScaffoldKey,
        drawer: Drawer(
          width: width * 0.5,
          child: Container(
            decoration: BoxDecoration(color: colorScheme(context).onPrimary),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height * 0.06,
                                width: width * 0.11,
                                child: SvgPicture.asset(
                                  AppIcons.drawerLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Go Shop",
                                style: textTheme(context).bodyMedium?.copyWith(
                                    color: colorScheme(context).primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              const SizedBox(height: 10),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 0
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.dashboardIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 0
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Dashboard',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              0
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(0);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 1
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.storeIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 1
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Store',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              1
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(1);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 2
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.storeIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 2
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Orders',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              2
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(2);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 3
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.customerIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 3
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Customers',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              3
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(3);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 4
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.promotionsIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 4
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Promotions',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              4
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(4);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 5
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.usersqueriesIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 5
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'User Queries',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              5
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(5);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 6
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.analyticsdIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 6
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Analytics',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              6
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(6);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 7
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.settingsIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 7
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Settings',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              7
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(7);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                              Consumer<DashboardProvider>(
                                builder: (context, provider, child) {
                                  return ListTile(
                                    title: Container(
                                      decoration: BoxDecoration(
                                        color: provider.selectedIndex == 8
                                            ? colorScheme(context).primary
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.logoutIcon,
                                            height: width * 0.023,
                                            colorFilter: ColorFilter.mode(
                                              provider.selectedIndex == 8
                                                  ? colorScheme(context)
                                                      .onPrimary
                                                  : colorScheme(context)
                                                      .outlineVariant,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Logout',
                                            style: textTheme(context)
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      provider.selectedIndex ==
                                                              8
                                                          ? colorScheme(context)
                                                              .onPrimary
                                                          : colorScheme(context)
                                                              .outlineVariant,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setSelectedIndex(8);
                                      context.pop();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.11,
              width: double.infinity,
              color: colorScheme(context).surface,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      _mobileScaffoldKey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: colorScheme(context).onSurface,
                      size: width * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<DashboardProvider>(
                        builder: (context, provider, child) {
                          return Text(
                            _getAppBarTitle(provider.selectedIndex),
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context).primary,
                                fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                      Consumer<DashboardProvider>(
                        builder: (context, provider, child) {
                          return Text(
                            "Detailed information about your ${_getAppBarTitle(provider.selectedIndex)}",
                            style: textTheme(context).labelLarge?.copyWith(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.66),
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: height * 0.06,
                    width: width * 0.4,
                    child: CustomTextFormField(
                      textStyle: textTheme(context)
                          .bodySmall
                          ?.copyWith(color: colorScheme(context).onSurface),
                      hint: "Search anything...",
                      hintSize: width * 0.017,
                      controller: searchController,
                      borderRadius: 30,
                    ),
                  ),
                  SizedBox(width: width * 0.015),
                  InkWell(
                      onTap: () {},
                      child: Badge(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          backgroundColor: colorScheme(context).error,
                          child: Icon(
                              color: colorScheme(context).outlineVariant,
                              size: width * 0.03,
                              Icons.notifications_none))),
                  SizedBox(width: width * 0.015),
                  CircleAvatar(
                    backgroundColor: colorScheme(context).outline,
                    radius: width * 0.02,
                    child: Center(
                        child: Icon(
                      Icons.person,
                      size: width * 0.02,
                    )),
                  ),
                  SizedBox(width: width * 0.01),
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                          width: width * 0.025, AppIcons.chevronDownIcon)),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
            Expanded(
              child: Consumer<DashboardProvider>(
                builder: (context, provider, child) {
                  return _screens[provider.selectedIndex];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
