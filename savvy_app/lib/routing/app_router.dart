import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../ui/onboarding/widgets/onboarding_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardingScreen(),
    ),
  ],
);
