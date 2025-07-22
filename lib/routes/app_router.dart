import 'package:auto_route/auto_route.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/home/presentation/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardingScreen, initial: true),
    AutoRoute(page: HomeScreen),
  ],
)
class AppRouter {}
