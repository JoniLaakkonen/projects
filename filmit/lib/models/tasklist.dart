class Tasklist {
  final String id;
  final String tasklistname;
  final String bucketId;

  Tasklist({
    required this.id,
    required this.tasklistname,
    required this.bucketId,
  });

  String getId() => id.toString();
  String getTasklistname() => tasklistname;
  String getBucketId() => bucketId;

  // Convert to JSON for storage (SQLite, Firestore, etc.)
  Map<String, dynamic> toJson() => {
        "id": id,
        "tasklistname": tasklistname,
        "bucketId": bucketId,
      };

  // Create object from JSON
  factory Tasklist.fromJson(Map<String, dynamic> json) {
    return Tasklist(
      id: json["id"],
      tasklistname: json["tasklistname"],
      bucketId: json["bucketId"],
    );
  }
}
