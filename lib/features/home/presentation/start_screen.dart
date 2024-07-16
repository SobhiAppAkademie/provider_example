import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/features/home/application/theme_service.dart';
import 'package:provider_example/features/home/application/user_service.dart';
import 'package:provider_example/features/home/domain/user_data.dart';
import 'package:provider_example/features/home/presentation/second_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<ThemeService>();
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


         

          Consumer<UserService>(
              builder: (BuildContext context, UserService service, Widget? child) {


              
            if (service.isLoggedIn) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Nutzer: ${service.userData!.fullName} - ${service.userData!.userDataRole == UserDataRole.adminUser ? "ADMIN" : "NUTZER"}"),
                  const SizedBox(
                    height: 50,
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: ElevatedButton(
                        onPressed: () => () {},
                        child: const Center(
                          child: Text("Bereits eingeloggt"),
                        )),
                  )
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Nicht eingeloggt"),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () => service.getUserData("1"),
                    child: const Center(
                      child: Text("Nutzer einloggen & abrufen"),
                    ))
              ],
            );
          }),
          const SizedBox(height: 50),
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen())), child: const Text("Navigiere zu Profil")),
            
          const SizedBox(height: 50),
          CupertinoSwitch(value: themeService.isLightTheme, onChanged: (val){
            themeService.changeTheme(val);
          }),
        
        ],
      ),
    ));
  }
}
