import 'task_category.dart';
import 'task_status.dart';

class TaskRequest {
  final String id;
  final TaskCategory category;
  final String origin;
  final String destination;
  final DateTime scheduledTime;
  final String? notes;
  final TaskStatus status;
  final String? assignedAssistantId;

  TaskRequest({
    required this.id,
    required this.category,
    required this.origin,
    required this.destination,
    required this.scheduledTime,
    this.notes,
    this.status = TaskStatus.requested,
    this.assignedAssistantId,
  });
}
