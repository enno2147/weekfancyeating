import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router.dart';
import 'core/theme.dart';

void main() {
  runApp(const ProviderScope(child: WeekFancyEatApp()));
}

class WeekFancyEatApp extends StatelessWidget {
  const WeekFancyEatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WeekFancyEat',
      theme: AppTheme.light,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}