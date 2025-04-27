import 'package:flutter/material.dart';
import 'package:sthedule/models/work_entry.dart';

class WorkEntryProvider with ChangeNotifier {
  final List<WorkEntry> _entries = [];

  List<WorkEntry> get entries => List.unmodifiable(_entries);

  void addEntry(WorkEntry entry) {
        _entries.add(entry);
    notifyListeners();
  }

  void removeEntry(WorkEntry entry) {
    _entries.remove(entry);
    notifyListeners();
  }

  int getLength() {
    return _entries.length;
  }

  WorkEntry getEntry(int index) { // Use nullable return type for better safety
    return _entries[index];
  }

  bool checkRunningEntry() { // Use nullable return type for better safety
    for (var i = 0; i < _entries.length; i++) {
      if(_entries[i].isRunning()){ //Placeholder looppi ++++ Korjaa tehokkaammaksi loopiksi Kunhan kerkiää.
        return true;
      }
    }
    return false;
  }

  // Additional useful methods
  List<WorkEntry> getEntries() {
    return List.unmodifiable(_entries); // Return an unmodifiable list for safety
  }
}