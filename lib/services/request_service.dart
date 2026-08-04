import 'dart:async';
import '../models/task_request.dart';
import '../models/task_category.dart';
import '../models/task_status.dart';
import '../models/community_assistant.dart';

class RequestService {
  static final RequestService _instance = RequestService._internal();
  factory RequestService() => _instance;
  RequestService._internal();

  final List<TaskRequest> _requests = [];
  
  List<TaskRequest> get requests => List.unmodifiable(_requests);

  Future<TaskRequest> createRequest({
    required TaskCategory category,
    required String origin,
    required String destination,
    required DateTime scheduledTime,
    String? notes,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    
    final newRequest = TaskRequest(
      id: 'CD-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
      category: category,
      origin: origin,
      destination: destination,
      scheduledTime: scheduledTime,
      notes: notes,
      status: TaskStatus.requested,
    );
    
    _requests.add(newRequest);
    return newRequest;
  }
  
  // MOCK: Finding an assistant
  Future<CommunityAssistant> findAssistantForRequest(String requestId) async {
    await Future.delayed(const Duration(seconds: 3));
    
    return CommunityAssistant(
      id: 'asst_456',
      name: 'Marcus Lee',
      photoUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDG_1VQoj60GXVfEzjYUYlflMaDoXBVruoGT8UFTF9hxJdoGj3j2NHn5-tGGeSUPWyEsYF0DgU8o2gZTcCK9lazwX71yydUExW_TTzzvtuCoM-2ggtyye2eCfLPw3MVDbxdKlG4JmV_pNEKTyJuQ5gVgEHc5l1HDH1hXdBNRo-8k4Jc6IMi6OnEzuVYHXAHCK4JbpK_WivHqAdJ-ba6Q0Iera7GJmHHZAO_AH5oxh1tr5zQRKXuTzCx',
      rating: 4.9,
      completedTasks: 124,
      description: 'Dedicated professional with extensive experience in high-stakes coordination and community assistance.',
    );
  }
}
