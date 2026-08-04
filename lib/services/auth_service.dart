import 'dart:async';
import '../models/user_model.dart';
import '../models/user_role.dart';

class AuthService {
  // Singleton pattern for simplicity in this prototype
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  
  bool get isAuthenticated => _currentUser != null;

  Future<bool> login(String email, String password) async {
    // MOCK: Delay to simulate network request
    await Future.delayed(const Duration(seconds: 2));
    
    // MOCK: Successful login
    _currentUser = UserModel(
      id: 'usr_123',
      name: 'Sarah Connor',
      email: email,
      phone: '+1 555-0198',
      role: UserRole.patient,
    );
    
    return true;
  }
  
  Future<bool> register(String email, String password, String name, UserRole role) async {
    await Future.delayed(const Duration(seconds: 2));
    
    _currentUser = UserModel(
      id: 'usr_124',
      name: name,
      email: email,
      phone: '+1 555-0000',
      role: role,
    );
    
    return true;
  }
  
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = null;
  }
}
