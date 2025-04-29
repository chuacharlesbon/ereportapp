
// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'app-cubit.dart';

class AppState extends Equatable {
  final StateStatus status;
  final AppModel? appData;
  final int pageLocation;
  final String? message;
  const AppState({
    this.status = StateStatus.initial,
    this.appData,
    this.pageLocation = 1,
    this.message
  });

  @override
  List<Object> get props => [status, if(appData != null)  appData!, pageLocation, if(message != null) message!];

  AppState copyWith({
    StateStatus? status,
    AppModel? appData,
    int? pageLocation,
    String? message,
  }) {
    return AppState(
      status: status ?? this.status,
      appData: appData ?? this.appData,
      pageLocation: pageLocation ?? this.pageLocation,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;
}
