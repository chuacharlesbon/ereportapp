import 'package:ereportapp/data/app-cubit/app-cubit.dart';
import 'package:ereportapp/firebase_options.dart';
import 'package:ereportapp/utils/routes.dart';
import 'package:ereportapp/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide AndroidOptions;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final serviceLocator = GetIt.instance;

void initializeRoutes() {
  serviceLocator.registerLazySingleton<RouteBase>(
    instanceName: 'all-routes',
    () => ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: child,
      ),
      routes: MyRoutes.myRoutes
    )
  );
  serviceLocator.registerLazySingleton<GoRouter>(
    () => GoRouter(
      initialLocation: '/',
      routes: [
        serviceLocator<RouteBase>(instanceName: 'all-routes'),
      ],
    ),
  );
}

void initializeWebView() async {
  if (!kIsWeb &&
      kDebugMode &&
      defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Use the generated options
  );
}

void initializeData() {
  serviceLocator.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true)
  ));
  serviceLocator.registerLazySingleton<AppCubit>(() => AppCubit());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    // setUrlStrategy(PathUrlStrategy());
  }

  initializeFirebase();
  initializeWebView();
  initializeRoutes();
  initializeData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EReport App',
      theme: MyTheme.lightTheme,
      routerConfig: serviceLocator<GoRouter>(),
    );
  }
}
