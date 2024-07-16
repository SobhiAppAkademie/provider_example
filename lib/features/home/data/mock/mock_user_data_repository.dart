import 'package:provider_example/features/home/data/user_repository.dart';
import 'package:provider_example/features/home/domain/user_data.dart';

class MockUserDataRepository implements UserRepository {


  @override
  Future<UserData?> getUserData(String id) {
    return Future.value(UserData(id, fullName: "Max Mustermann", birth: DateTime(1990, 10, 10), userDataRole: UserDataRole.adminUser));
  }

  @override
  Future<bool> logOut(){
    return Future.value(true);
  }

}