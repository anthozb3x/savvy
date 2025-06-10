import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../ui/onboarding/widgets/onboarding_screen.dart';
import '../ui/inscription/widgets/inscription_screen.dart';
import '../ui/connexion/widgets/connexion_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const ConnexionScreen(),
    ),
    GoRoute(
      path: '/inscription',
      builder: (context, state) => const InscriptionScreen(),
    ),
  ],
);
