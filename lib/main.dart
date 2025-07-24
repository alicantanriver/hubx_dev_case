import 'package:flutter/material.dart';
import 'routes/app_router.dart';

void main() {
  final appRouter = AppRouter();
  runApp(MyApp(router: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Case App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerConfig: router.config(),
    );
  }
}
