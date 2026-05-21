import 'package:go_router/go_router.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/home/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);