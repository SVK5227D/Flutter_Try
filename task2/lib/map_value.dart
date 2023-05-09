class UserInput {
  int? id;
  String? firstName, lastName, emailid, mobileNumber;

  toMap() {
    print('tomap active');
    var map = <String, dynamic>{};
    map['id'] = id;
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["emailid"] = emailid;
    map["mobileNumber"] = mobileNumber;
    return map;
  }

}
