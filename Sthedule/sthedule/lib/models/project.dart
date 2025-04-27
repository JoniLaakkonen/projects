class Project {
  String? _id;
  String _projectName;
  String _projectNumber;
  String _description;
  DateTime _startDate;
  DateTime _endDate;
  String _projectStatus;
  String _keyPerfInd;
  String _tasks;
  List<String> _workEntries;
  String _projectColor;

  Project(
    this._projectName,
    this._projectNumber,
    this._description,
    this._startDate,
    this._endDate,
    this._projectStatus,
    this._keyPerfInd,
    this._tasks,
    this._workEntries,
    this._projectColor,
  );

  // Getters in the format you asked for:

  String? getId() {
    return _id;
  }

  String getProjectName() {
    return _projectName;
  }

  String getProjectNumber() {
    return _projectNumber;
  }

  String getDescription() {
    return _description;
  }

  DateTime getStartDate() {
    return _startDate;
  }

  DateTime getEndDate() {
    return _endDate;
  }

  String getProjectStatus() {
    return _projectStatus;
  }

  String getKeyPerfInd() {
    return _keyPerfInd;
  }

  String getTasks() {
    return _tasks;
  }

  List<String> getWorkEntries() {
    return _workEntries;
  }

  String getProjectColor() {
    return _projectColor;
  }

  //Days left
  String getProjectDuration() {
    return '${_endDate.difference(_startDate).inDays} days';
  }
}