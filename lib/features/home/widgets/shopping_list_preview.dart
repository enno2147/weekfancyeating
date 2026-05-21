import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class ShoppingListPreview extends StatelessWidget {
  const ShoppingListPreview({super.key});

  final List<String> items = const [
    "500g Champignons",
    "300g Pasta",
    "2 Zwiebeln",
    "200ml Sahne",
    "4 Hähnchenbrustfilets",
    "1 Avocado",
    "200g Räucherlachs",
    "Frische Kräuter",
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Einkaufsliste", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...items.take(6).map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.check_box_outline_blank, color: Colors.grey),
                      const SizedBox(width: 12),
                      Text(item),
                    ],
                  ),
                )),
            TextButton(
              onPressed: () {},
              child: const Text("Vollständige Liste ansehen →"),
            ),
          ],
        ),
      ),
    );
  }
}