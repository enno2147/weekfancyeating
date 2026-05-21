import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user_preferences.dart';
import '../../core/theme.dart';

final onboardingProvider = StateProvider<UserPreferences>((ref) => UserPreferences());

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final prefs = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    final pages = [
      _welcomePage(),
      _householdPage(prefs, notifier),
      _budgetPage(prefs, notifier),
      _effortPage(prefs, notifier),
      _finishPage(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (currentPage + 1) / pages.length,
              color: AppTheme.primary,
            ),
            Expanded(child: pages[currentPage]),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentPage > 0)
                    TextButton(
                      onPressed: () => setState(() => currentPage--),
                      child: const Text("Zurück"),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (currentPage == pages.length - 1) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        setState(() => currentPage++);
                      }
                    },
                    child: Text(currentPage == pages.length - 1 ? "Los geht's!" : "Weiter"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _welcomePage() => const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant, size: 120, color: Color(0xFFE07A5F)),
              SizedBox(height: 30),
              Text("Willkommen bei WeekFancyEat", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text("Dein persönlicher Wochen-Essensplaner", textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      );

  Widget _householdPage(UserPreferences prefs, StateProviderNotifier notifier) => _singleChoicePage(
        title: "Für wie viele Personen kochst du?",
        options: const ["1", "2", "3", "4", "5+"],
        selected: prefs.householdSize.toString(),
        onSelect: (val) => notifier.state = prefs.copyWith(householdSize: int.tryParse(val) ?? 2),
      );

  Widget _budgetPage(UserPreferences prefs, StateProviderNotifier notifier) => _singleChoicePage(
        title: "Welchen Modus möchtest du?",
        options: const ["Günstig", "Normal", "Fancy"],
        selected: prefs.budgetMode == "gunstig" ? "Günstig" : prefs.budgetMode == "normal" ? "Normal" : "Fancy",
        onSelect: (val) {
          String mode = val == "Günstig" ? "gunstig" : val == "Normal" ? "normal" : "fancy";
          notifier.state = prefs.copyWith(budgetMode: mode);
        },
      );

  Widget _effortPage(UserPreferences prefs, StateProviderNotifier notifier) => _singleChoicePage(
        title: "Wie schnell sollen die Rezepte sein?",
        options: const ["Schnell (<30 min)", "Mittel", "Aufwändig"],
        selected: prefs.effortLevel == "schnell" ? "Schnell (<30 min)" : prefs.effortLevel == "mittel" ? "Mittel" : "Aufwändig",
        onSelect: (val) {
          String level = val.contains("Schnell") ? "schnell" : val.contains("Mittel") ? "mittel" : "aufwaendig";
          notifier.state = prefs.copyWith(effortLevel: level);
        },
      );

  Widget _finishPage() => const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 100, color: Colors.green),
              SizedBox(height: 30),
              Text("Fertig!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text("Dein erster Wochenplan wird gleich erstellt.", textAlign: TextAlign.center),
            ],
          ),
        ),
      );

  Widget _singleChoicePage({
    required String title,
    required List<String> options,
    required String selected,
    required Function(String) onSelect,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          ...options.map((opt) => RadioListTile<String>(
                title: Text(opt),
                value: opt,
                groupValue: selected,
                onChanged: (v) => onSelect(v!),
              )),
        ],
      ),
    );
  }
}