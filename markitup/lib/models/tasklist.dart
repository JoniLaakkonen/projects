class TaskList {
  final String _id;
  String _taskname;

  TaskList(
    this._id,
    this._taskname,
  );
  
  // Getters
  String getId() => _id;
  String getTaskName() => _taskname;
  // Setters
  void setLinkedProject(String value) => _taskname = value;
}