import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hunt_share_live_admin_panel/features/dashboard/pages/dashboard_page.dart';
import 'package:hunt_share_live_admin_panel/features/forget/pages/forget_password_page.dart';
import 'package:hunt_share_live_admin_panel/features/login/pages/login_page.dart';
import 'package:hunt_share_live_admin_panel/features/signup/pages/signUp_page.dart';
import 'package:hunt_share_live_admin_panel/features/verify_email/verify_email_page.dart';

import 'error_route.dart';
import 'route_transition.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.dashboardScreen}',
    routes: [
      GoRoute(
        name: AppRoute.errorPage,
        path: '/${AppRoute.errorPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ErrorPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.dashboardScreen,
        path: '/${AppRoute.dashboardScreen}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DashboardPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.signUpPage,
        path: '/${AppRoute.signUpPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SignUpPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.loginPage,
        path: '/${AppRoute.loginPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.forgetPasswordPage,
        path: '/${AppRoute.forgetPasswordPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ForgetPasswordPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.verifyEmailPage,
        path: '/${AppRoute.verifyEmailPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const VerifyEmailPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';
  static const String dashboardScreen = 'dashboard-screen';
  static const signUpPage = 'sign-up-page';
  static const loginPage = 'login-page';
  static const forgetPasswordPage = 'forget_password-page';
  static const verifyEmailPage = 'verify_email-page';
  static const String ordersPage = 'orders-page';
  static const String orderDetailPage = 'order-detail-page';
  static const String customerDetailPage = 'customer-detail-page';
  static const String promotionDetailPage = 'promotion-detail-page';
}
