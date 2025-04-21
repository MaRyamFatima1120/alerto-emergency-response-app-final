import 'package:flutter/material.dart';

import '../../../core/utils/shared_preferences_helper.dart';
import '../model/emergency_request_model.dart';
import '../services/firestore_service.dart';

class EmergencyRequestProvider1 extends ChangeNotifier {
  final FireStoreService fireStoreService;
  Stream<List<EmergencyRequest>> _requestStream = Stream.value([]);  // Default to an empty stream
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;
  Stream<List<EmergencyRequest>> get requestStream => _requestStream;

  EmergencyRequestProvider1({required this.fireStoreService}) {
    _initializeStream();
  }

  void _initializeStream() async {
    String? phone = await SharedPreferencesHelper.getPhoneLocally();
    if (phone != null && phone.isNotEmpty) {
      _isAuthenticated = true;
      _requestStream = fireStoreService.getRequest(phone);
    } else {
      _isAuthenticated = false;
      _requestStream = Stream.value([]);  // Provide an empty stream if no phone number
    }
    notifyListeners();  // Notify listeners after stream is initialized
  }
}
