import 'package:flutter/cupertino.dart';
import 'package:provider_example/features/home/data/user_repository.dart';
import 'package:provider_example/features/home/domain/user_data.dart';

class UserService extends ChangeNotifier {

  final UserRepository userRepository;

  UserService(this.userRepository);

  UserData? userData;
  bool get isLoggedIn => userData != null;

  bool loading = false;


  Future<void> getUserData(String userId) async {
    loading = true;
    notifyListeners();
    userData = await userRepository.getUserData(userId);
    loading = false;
    notifyListeners();
  }


  Future<void> logOut() async {
    final success = await userRepository.logOut();
    if(success){
      userData = null;
      notifyListeners();
    }
  }
}