import 'dart:developer';
import 'package:ereportapp/data/api.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, this.title});

  final String? title;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  void initData() async {
    log("Initialize test screen");
    AppDataSource data = AppDataSource();
    dynamic response = await data.getData(path: "v1/test");
    print("This is the response: $response");
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
            Text("Test")
          ],
        ),
      ),
    );
  }
}
