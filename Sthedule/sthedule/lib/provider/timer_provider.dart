import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Stopwatch _stopwatch = Stopwatch();
  late DateTime _startTimestamp;
  late DateTime _endTimestamp;

  bool get isRunning => _stopwatch.isRunning;

  Duration get elapsedTime => _stopwatch.elapsed;

  DateTime get startTimestamp => _startTimestamp;

  DateTime get endTimestamp => _endTimestamp;

  void startTimer() async {
    _stopwatch.start();
    _startTimestamp = DateTime.now();

    notifyListeners();
  }

  void stopTimer() async {
    _stopwatch.stop();
    _endTimestamp = DateTime.now();

    notifyListeners();
  }

  void resetTimer() {
    _stopwatch.reset();
    notifyListeners();
  }
}
