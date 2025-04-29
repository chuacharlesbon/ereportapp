import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ereportapp/data/api.dart';
import 'package:ereportapp/data/app-cubit/app-model.dart';
import 'package:ereportapp/utils/constants/enums.dart';

part 'app-state.dart';

class AppCubit extends Cubit<AppState> {
  late final AppDataSource datasource;
  AppCubit() : super(const AppState()) {
    datasource = AppDataSource();
  }

  Future<void> testEvent({
    required String testData,
  }) async {
    try {
      final result = await datasource.getData(path: 'v1/test');
      log('AppCubit testEvent ${result.toString()}');
      if (result.toString().contains("Error")) {
        emit(
          state.copyWith(status: StateStatus.error, message: result),
        );
      } else {
        emit(
          state.copyWith(
              status: StateStatus.loaded,
              message: "Test success"),
        );
      }
    } catch (e) {
      log('Catch AppCubit testEvent ${e.toString()}');
      emit(
        state.copyWith(
            status: StateStatus.error, message: "Error: ${e.toString()}"),
      );
    }
  }

  Future<void> testList({
    required int pageLocation,
    required int itemsPerPage,
  }) async {
    try {
      final result = await datasource.postData(
        path: "v1/test",
        bodyData: {
          "pageLocation": pageLocation,
          "itemsPerPage": itemsPerPage
        }
      );
      log('AppCubit testList ${result.toString().substring(0, 25)}');
      if (result.toString().contains("Error")) {
        emit(
          state.copyWith(status: StateStatus.error, message: result),
        );
      } else {
        AppModel appData = AppModel.fromJson(result);
        emit(
          state.copyWith(
            status: StateStatus.loaded,
            appData: appData,
            pageLocation: pageLocation,
            message: "Data loaded successfully"
          ),
        );
      }
    } catch (e) {
      log('Catch AppCubit usersList ${e.toString()}');
      emit(
        state.copyWith(
            status: StateStatus.error, message: "Error: ${e.toString()}"),
      );
    }
  }
}