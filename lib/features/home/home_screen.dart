import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme.dart';
import 'widgets/weekly_plan_card.dart';
import 'widgets/shopping_list_preview.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WeekFancyEat"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/onboarding'),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Diese Woche",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Montag, 25. Mai – Sonntag, 31. Mai",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            WeeklyPlanCard(),
            SizedBox(height: 24),
            ShoppingListPreview(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Später neuen Plan generieren
        },
        icon: const Icon(Icons.refresh),
        label: const Text("Neuen Plan"),
        backgroundColor: AppTheme.primary,
      ),
    );
  }
}