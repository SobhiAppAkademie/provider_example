import 'package:flutter/material.dart';
import 'package:provider_example/features/home/application/user_service.dart';
import 'package:provider_example/features/home/presentation/components/profile_header.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});


  void signOut(UserService userService){
      // Anderen Code
      userService.logOut();
  }

  @override
  Widget build(BuildContext context) {
   
    return const Scaffold(body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ProfileHeader(),
          Text("Profil", style: TextStyle(fontSize: 20),),
          SizedBox(height: 40),
          
        ],
      ),
    ));
  }
}
