

class WorkEntry {
  String? _id;
  String _project;
  String _task;
  String _tag;
  DateTime _date;
  bool _running = false;
  late DateTime _startTime;
  late DateTime _endTime;
  String _comment;

  WorkEntry(
    this._project,
    this._task,
    this._tag,
    this._date,
    this._startTime,
    this._endTime,
    this._comment,
  );

  // Getters
  String getId() => _id.toString();
  String getProject() => _project;
  String getTask() => _task;
  String getTag() => _tag;
  DateTime getDate() => _date;
  DateTime getStartTime() => _startTime;
  DateTime getEndTime() => _endTime;
  String getComment() => _comment;
  bool isRunning() => _running;

  // Setters
  void setProject(String value) => _project = value;
  void setTask(String value) => _task = value;
  void setTag(String value) => _tag = value;
  void setDate(DateTime value) => _date = value;
  void setStartTime(DateTime value) => _startTime = value;
  void setEndTime(DateTime value) => _endTime = value;
  void setComment(String value) => _comment = value;
  void setRunning() => _running = !_running;
}