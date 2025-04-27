import 'dart:developer';
import 'package:ereportapp/components/bottom-navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title});

  final String? title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initData() {
    log("Initialize home screen");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // initData();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home")
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
