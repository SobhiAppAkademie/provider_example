import '../domain/user_data.dart';

abstract class UserRepository {
  Future<UserData?> getUserData(String id);
  Future<bool> logOut();
}