class Task {
  final String id;
  final String taskname;
  final String listId;
  bool status;

  Task({
    required this.id,
    required this.taskname,
    required this.listId,
    this.status = false,
  });

  String getId() => id.toString();
  String getTaskname() => taskname;
  String getListId() => listId;

  // Convert to JSON for storage (SQLite, Firestore, etc.)
  Map<String, dynamic> toJson() => {
        "id": id,
        "taskname": taskname,
        "listId": listId,
        "status": status,
      };

  // Create object from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      taskname: json["taskname"],
      listId: json["listId"],
      status: json["status"] ?? false,
    );
  }
}
