import 'package:flutter/material.dart';
import 'package:sthedule/models/quick_entry.dart';

class QuickEntryProvider with ChangeNotifier {
  final List<QuickEntry> _entries = [];

  List<QuickEntry> get entries => _entries;

  void addEntry(QuickEntry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  void removeEntry(QuickEntry entry) {
    _entries.remove(entry);
    notifyListeners();
  }
}