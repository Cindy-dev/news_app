enum NewsCategories {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology
}

extension CategoriesExtension on NewsCategories {
  String get getString {
    switch (this) {
      case NewsCategories.business:
        return "business";
      case NewsCategories.entertainment:
        return "entertainment";
      case NewsCategories.general:
        return "general";
      case NewsCategories.health:
        return "health";
      case NewsCategories.science:
        return "science";
      case NewsCategories.sports:
        return "sports";
      case NewsCategories.technology:
        return "technology";
      default:
        return "Unknown";
    }
  }
}
