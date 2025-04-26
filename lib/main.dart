import 'package:ereportapp/utils/routes.dart';
import 'package:ereportapp/utils/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    // setUrlStrategy(PathUrlStrategy());
  }
  initializeRoutes();
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
