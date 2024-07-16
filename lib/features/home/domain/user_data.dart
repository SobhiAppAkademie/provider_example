enum UserDataRole {normalUser, adminUser}

class UserData {
  final String id;
  final String fullName;
  final DateTime birth;
  final UserDataRole userDataRole;

  factory UserData.fromMap(Map<String,dynamic> map, String id){
    return UserData(id, fullName: map["fullname"], birth: map["birth"].toDate(), userDataRole: UserDataRole.values.byName(map["userDataRole"]));
  }

  UserData(this.id, {required this.fullName, required this.birth, required this.userDataRole});

}