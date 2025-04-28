import 'dart:developer';

import 'package:ereportapp/utils/firebase.dart';
import 'package:ereportapp/utils/helpers.dart';
import 'package:ereportapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, this.title});

  final String? title;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  late String location;

  void initData() {
    log("Initialize BottomNavBar");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    location = GoRouter.of(context).state.fullPath ?? "/";
    // initData();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              logEvent(eventName: "Home");
              goTo(ctx: context, pathname: RouteNames.home.name);
            },
            child: Icon(
              Icons.home,
              color: location == RouteNames.home.path
                ? Colors.red
                : null
            ),
          ),
          GestureDetector(
            onTap: () {
              logEvent(eventName: "Chat");
              goTo(ctx: context, pathname: RouteNames.iframeChat.name);
            },
            child: const Icon(
              Icons.chat
            ),
          ),
          GestureDetector(
            onTap: () {
              logEvent(eventName: "Settings");
            },
            child: const Icon(
              Icons.settings
            ),
          ),
        ]
      ),
    );
  }
}
