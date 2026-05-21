import 'package:flutter/foundation.dart';

class UserPreferences {
  final int householdSize;
  final String budgetMode; // "gunstig", "normal", "fancy"
  final String effortLevel; // "schnell", "mittel", "aufwaendig"
  final List<String> diets;
  final List<String> favoriteSupermarkets;

  UserPreferences({
    this.householdSize = 2,
    this.budgetMode = "normal",
    this.effortLevel = "mittel",
    List<String>? diets,
    List<String>? favoriteSupermarkets,
  })  : diets = diets ?? ["alles"],
        favoriteSupermarkets = favoriteSupermarkets ?? ["aldi", "lidl"];

  UserPreferences copyWith({
    int? householdSize,
    String? budgetMode,
    String? effortLevel,
    List<String>? diets,
    List<String>? favoriteSupermarkets,
  }) {
    return UserPreferences(
      householdSize: householdSize ?? this.householdSize,
      budgetMode: budgetMode ?? this.budgetMode,
      effortLevel: effortLevel ?? this.effortLevel,
      diets: diets ?? this.diets,
      favoriteSupermarkets: favoriteSupermarkets ?? this.favoriteSupermarkets,
    );
  }
}