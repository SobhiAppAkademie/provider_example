import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/features/home/application/user_service.dart';
import 'package:provider_example/features/home/domain/user_data.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
              builder: (BuildContext context, UserService service, Widget? child) {
                if (service.isLoggedIn) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Vollständiger Name: ${service.userData!.fullName}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "Rolle: ${service.userData!.userDataRole == UserDataRole.adminUser ? "Admin": "Nutzer"}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          "Geburtsdatum: ${service.userData!.birth.day}.${service.userData!.birth.month}.${service.userData!.birth.year}"),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => service.logOut(),
                          child: const Center(
                            child: Text("Ausloggen"),
                          )),
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Center(
                            child: Text("Zurück"),
                          ))
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Keine Daten vorhanden"),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Center(
                          child: Text("Zurück"),
                        ))
                  ],
                );
              });
  }
}