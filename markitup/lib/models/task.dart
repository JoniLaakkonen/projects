class Task {
  final String id;
  final String taskname;
  final String listId;
  final String? comment;
  final StateVariable? state; // Taskin satate, korjaa kaikkialle. 
  bool status;

  Task({
    required this.id,
    required this.taskname,
    required this.listId,
    this.state,  // Default empty list
    this.status = false,     // Default false
    this.comment,
  });

  String getId() => id.toString();
  String getTaskname() => taskname;
  String getListId() => listId;
  String getComment() => comment.toString();

  // Convert to JSON for storage (SQLite, Firestore, etc.)
  Map<String, dynamic> toJson() => {
        "id": id,
        "taskname": taskname,
        "listId": listId,
        "status": status,
        "comment": comment,
        "state": state,
      };

  // Create object from JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      taskname: json["taskname"],
      listId: json["listId"],
      status: json["status"] ?? false,
      comment: json["comment"],
      state: (json['state'] ?? []),
    );
  }
}

class StateVariable {
  int state;
  String variable;

  StateVariable({required this.state, required this.variable});

  // Convert to JSON (for Firebase or SQLite)
  Map<String, dynamic> toJson() => {
        "state": state,
        "variable": variable,
      };

  // Convert from JSON
  factory StateVariable.fromJson(Map<String, dynamic> json) {
    return StateVariable(
      state: json["state"],
      variable: json["variable"],
    );
  }
}

// List of objects
List<StateVariable> stateVariableList = [
  StateVariable(state: 0, variable: "temperature"),
  StateVariable(state: 0, variable: "humidity"),
];

/* Loop through it
for (var item in stateVariableList) {
  print("State: ${item.state}, Variable: ${item.variable}");
}
*/