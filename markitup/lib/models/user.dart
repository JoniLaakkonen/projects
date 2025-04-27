class User {
  String _id;
  String _lastName;
  String _firstName;
  String _username;
  String _email;
  String _password;
  List<String> _workEntries;
  String _company;
  String _userLevel;
  String _profilePicture;

  User(
    this._id,
    this._lastName,
    this._firstName,
    this._username,
    this._email,
    this._password,
    this._workEntries,
    this._company,
    this._userLevel,
    this._profilePicture,
  );

  // Getters
  String getId() => _id;

  String getLastName() => _lastName;

  String getFirstName() => _firstName;

  String getUsername() => _username;

  String getEmail() => _email;

  String getPassword() => _password;

  List<String> getWorkEntries() => _workEntries;

  String getCompany() => _company;

  String getUserLevel() => _userLevel;
  
  String getProfilePicture() => _profilePicture;String get shortenedName {
    return '${_firstName[0]}${_lastName[0]}'.toUpperCase();
  }


   // Setters
  void setLastName(String value) => _lastName = value;
  void setFirstName(String value) => _firstName = value;
  void setUsername(String value) => _username = value;
  void setEmail(String value) => _email = value;
  void setPassword(String value) => _password = value;
  void setWorkEntries(List<String> value) => _workEntries = value;
  void setCompany(String value) => _company = value;
  void setUserLevel(String value) => _userLevel = value;
  void setProfilePicture(String value) => _profilePicture = value;
}