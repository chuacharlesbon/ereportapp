import 'dart:developer';
import 'package:ereportapp/data/app-cubit/app-cubit.dart';
import 'package:ereportapp/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key, this.title});

  final String? title;

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  // Cubit
  late AppCubit appCubit;

  void initData() async {
    log("Initialize test screen");
    
    // AppDataSource data = AppDataSource();
    // dynamic response = await data.getData(path: "v1/test");
    // log("This is the response: $response");

    if(appCubit.state.status != StateStatus.loaded){
      appCubit.testEvent(testData: "");
    }
  }

  void onListen(AppState state) async {
    log("This is the listener ${state.message} ${state.appData}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // initData();
    super.initState();
    appCubit = GetIt.instance<AppCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      bloc: appCubit,
      listener: (context, state) {
        onListen(state);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SizedBox.fromSize(
            size: MediaQuery.of(context).size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Test: ${state.message ?? "Loading ..."}")
              ],
            ),
          ),
        );
      }
    );
  }
}
