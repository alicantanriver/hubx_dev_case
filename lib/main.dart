import 'package:flutter/material.dart';
import 'package:hubx_dev_case/routes/app_router.dart';

void main() {
  final _appRouter = AppRouter();
  runApp(MyApp(router: _appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Case App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
