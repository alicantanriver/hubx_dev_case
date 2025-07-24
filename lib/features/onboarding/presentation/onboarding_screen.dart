import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hubx_dev_case/routes/app_router.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Home and replace onboarding
            context.router.replace(const HomeRoute());
          },
          child: const Text('Finish Onboarding'),
        ),
      ),
    );
  }
}
