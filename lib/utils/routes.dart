import 'package:ereportapp/pages/home.dart';
import 'package:ereportapp/pages/iframe-chat.dart';
import 'package:ereportapp/pages/mobile-chat.dart';
import 'package:ereportapp/pages/splash.dart';
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
}