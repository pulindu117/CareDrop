enum TaskStatus {
  requested,
  findingAssistant,
  assistantFound,
  accepted,
  inProgress,
  completed,
  cancelled,
}

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case TaskStatus.requested:
        return 'Requested';
      case TaskStatus.findingAssistant:
        return 'Finding Assistant';
      case TaskStatus.assistantFound:
        return 'Assistant Found';
      case TaskStatus.accepted:
        return 'Accepted';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
    }
  }
}
