class Notification {
  String _id;
  String _linkedProject;
  String _linkedUser;
  String _linkedTeam;
  String _description;

  Notification(
    this._id,
    this._linkedProject,
    this._linkedUser,
    this._linkedTeam,
    this._description,
  );

  // Getters
  String getId() => _id;
  String getLinkedProject() => _linkedProject;
  String getLinkedUser() => _linkedUser;
  String getLinkedTeam() => _linkedTeam;
  String getDescription() => _description;

  // Setters
  void setLinkedProject(String value) => _linkedProject = value;
  void setLinkedUser(String value) => _linkedUser = value;
  void setLinkedTeam(String value) => _linkedTeam = value;
  void setDescription(String value) => _description = value;
}