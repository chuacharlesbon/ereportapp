import 'package:ereportapp/pages/home.dart';
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
}