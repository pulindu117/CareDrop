enum TaskCategory {
  medicinePickup,
  labReport,
  queueAssistance,
  foodDelivery,
  essentialItems,
  other,
}

extension TaskCategoryExtension on TaskCategory {
  String get displayName {
    switch (this) {
      case TaskCategory.medicinePickup:
        return 'Medicine Pickup';
      case TaskCategory.labReport:
        return 'Lab Reports';
      case TaskCategory.queueAssistance:
        return 'Queue Assistance';
      case TaskCategory.foodDelivery:
        return 'Food Delivery';
      case TaskCategory.essentialItems:
        return 'Essential Items';
      case TaskCategory.other:
        return 'Other';
    }
  }
}
