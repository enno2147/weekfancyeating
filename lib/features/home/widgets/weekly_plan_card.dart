import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/theme.dart';

class WeeklyPlanCard extends StatelessWidget {
  const WeeklyPlanCard({super.key});

  final List<Map<String, String>> dummyDays = const [
    {
      "day": "Montag",
      "meal": "Creamy Mushroom Pasta",
      "image": "https://picsum.photos/id/292/800/600",
      "time": "25 min"
    },
    {
      "day": "Dienstag",
      "meal": "Grilled Chicken Bowl",
      "image": "https://picsum.photos/id/1080/800/600",
      "time": "30 min"
    },
    {
      "day": "Mittwoch",
      "meal": "Avocado Salmon Toast",
      "image": "https://picsum.photos/id/431/800/600",
      "time": "15 min"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Wochenplan", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...dummyDays.map((day) => Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: day["image"]!,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      title: Text(day["day"]!, style: const TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text(day["meal"]!),
                      trailing: Chip(label: Text(day["time"]!)),
                    ),
                    const Divider(height: 8),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}