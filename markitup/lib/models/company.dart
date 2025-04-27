class Company {
  String? _id;
  String _businessID;
  String _companyName;
  String _address;
  String _email;
  String _phoneNumber;
  String _subscription;
  int _companySize;
  String _logo;

  Company(
    this._businessID,
    this._companyName,
    this._address,
    this._email,
    this._phoneNumber,
    this._subscription,
    this._companySize,
    this._logo,
  );

  // Getters
  String? getId() => _id;
  String getBusinessID() => _businessID;
  String getCompanyName() => _companyName;
  String getAddress() => _address;
  String getEmail() => _email;
  String getPhoneNumber() => _phoneNumber;
  String getSubscription() => _subscription;
  int getCompanySize() => _companySize;
  String getLogo() => _logo;

  // Setters
  void setBusinessID(String value) => _businessID = value;
  void setCompanyName(String value) => _companyName = value;
  void setAddress(String value) => _address = value;
  void setEmail(String value) => _email = value;
  void setPhoneNumber(String value) => _phoneNumber = value;
  void setSubscription(String value) => _subscription = value;
  void setCompanySize(int value) => _companySize = value;
  void setLogo(String value) => _logo = value;
}