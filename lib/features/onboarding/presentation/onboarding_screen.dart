import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.replace(const HomeRoute());
          },
          child: const Text('Finish Onboarding'),
        ),
      ),
    );
  }
}
