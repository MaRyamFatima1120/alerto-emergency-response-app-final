import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimerWidget extends ChangeNotifier{
  Duration _remaining = const Duration(minutes: 5); // Default 5 minutes
  bool _isSearching = true;
  bool _timerExpired = false;
  Timer? _timer;

  Duration get remaining => _remaining;
  bool get isSearching => _isSearching;
  bool get timerExpired => _timerExpired;

  // Start the timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining.inSeconds <= 1) {
        _timer?.cancel();
        _isSearching = false;
        _timerExpired = true;
        notifyListeners();
      } else {
        _remaining = _remaining - const Duration(seconds: 1);
        notifyListeners();
      }
    });
  }

  // Reset the timer
  void resetTimer() {
    _remaining = const Duration(minutes: 5);
    _isSearching = true;
    _timerExpired = false;
    startTimer();
    notifyListeners();
  }

  // Formatting time for display
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }
}