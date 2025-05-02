import 'package:ereportapp/pages/home.dart';
import 'package:ereportapp/pages/iframe-chat.dart';
import 'package:ereportapp/pages/mobile-chat.dart';
import 'package:ereportapp/pages/report.dart';
import 'package:ereportapp/pages/splash.dart';
import 'package:ereportapp/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRoutes {
  static List<GoRoute> myRoutes = [
    /////////////////////////////////
    /// SPLASH ROUTE              ///
    /////////////////////////////////
    GoRoute(
      path: RouteNames.splash.path,
      name: RouteNames.splash.name,
      builder: (context, state) => const SafeArea(
        child: Scaffold(body: SplashScreen()),
      ),
    ),
    /////////////////////////////////
    /// HOME ROUTE                ///
    /////////////////////////////////
    GoRoute(
      path: RouteNames.home.path,
      name: RouteNames.home.name,
      builder: (context, state) => const SafeArea(
        child: Scaffold(body: HomeScreen()),
      ),
      routes: [
        /////////////////////////////////
        /// IFRAME CHAT ROUTE         ///
        /////////////////////////////////
        GoRoute(
          path: RouteNames.iframeChat.path,
          name: RouteNames.iframeChat.name,
          builder: (context, state) => const SafeArea(
            child: Scaffold(body: IFrameChatScreen()),
          ),
        ),
        /////////////////////////////////
        /// REPORT ROUTE              ///
        /////////////////////////////////
        GoRoute(
          path: RouteNames.reportSuccess.path,
          name: RouteNames.reportSuccess.name,
          builder: (context, state) => const SafeArea(
            child: Scaffold(body: ReportSuccessScreen()),
          ),
        ),
      ]
    ),
    /////////////////////////////////
    /// CHAT ROUTE                ///
    /////////////////////////////////
    GoRoute(
      path: RouteNames.mobileChat.path,
      name: RouteNames.mobileChat.name,
      builder: (context, state) => const SafeArea(
        child: Scaffold(body: ChatScreen()),
      ),
    ),
    /////////////////////////////////
    /// TEST ROUTE                ///
    /////////////////////////////////
    GoRoute(
      path: RouteNames.test.path,
      name: RouteNames.test.name,
      builder: (context, state) => const SafeArea(
        child: Scaffold(body: TestScreen()),
      ),
    ),
  ];
}

class MyRouteModel {
      String name;
      String path;

  MyRouteModel({
      this.name = "",
      this.path = "",
  });
}

class RouteNames {
  /////////////////////////////////
  /// SPLASH ROUTE              ///
  /////////////////////////////////
  static MyRouteModel splash = MyRouteModel(
    name: "splash",
    path: "/",
  );
  /////////////////////////////////
  /// HOME ROUTE                ///
  /////////////////////////////////
  static MyRouteModel home = MyRouteModel(
    name: "home",
    path: "/home",
  );
  /////////////////////////////////
  /// CHAT ROUTES               ///
  /////////////////////////////////
  static MyRouteModel mobileChat = MyRouteModel(
    name: "mobile-chat",
    path: "/mobile-chat",
  );
  static MyRouteModel iframeChat = MyRouteModel(
    name: "iframe-chat",
    path: "/iframe-chat",
  );
  /////////////////////////////////
  /// REPORT ROUTE                ///
  /////////////////////////////////
  static MyRouteModel reportSuccess = MyRouteModel(
    name: "report-success",
    path: "/report-success",
  );
  /////////////////////////////////
  /// TEST ROUTE                ///
  /////////////////////////////////
  static MyRouteModel test = MyRouteModel(
    name: "test",
    path: "/test",
  );
}