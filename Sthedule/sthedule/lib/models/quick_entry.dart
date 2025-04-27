import 'package:flutter/material.dart';

class QuickEntry {
  String? _id;
  String _project;
  String _task;
  String _tag;
  IconData _icon;

  QuickEntry(
    this._project,
    this._task,
    this._tag,
    this._icon,
  );

  // Getters
  String getId() => _id.toString();
  String getProject() => _project;
  String getTask() => _task;
  String getTag() => _tag;
  IconData getIcon() => _icon;

  // Setters
  void setProject(String value) => _project = value;
  void setTask(String value) => _task = value;
  void setTag(String value) => _tag = value;
  void setIcon(IconData value) => _icon = value;
}