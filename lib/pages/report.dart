import 'dart:developer';
import 'package:ereportapp/utils/themes.dart';
import 'package:flutter/material.dart';

class ReportSuccessScreen extends StatefulWidget {
  const ReportSuccessScreen({super.key, this.title});

  final String? title;

  @override
  State<ReportSuccessScreen> createState() => _ReportSuccessScreenState();
}

class _ReportSuccessScreenState extends State<ReportSuccessScreen> {

  void initData() async {
    log("Initialize test screen");
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
      appBar: AppBar(),
      body: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Report submitted",
              style: MyTheme.lightTheme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
