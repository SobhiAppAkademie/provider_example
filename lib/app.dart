import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/features/home/application/theme_service.dart';
import 'package:provider_example/features/home/presentation/start_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (BuildContext context, ThemeService service, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.white),
          ),
          darkTheme:  ThemeData(
            useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.black),
          ),
          themeMode: service.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          initialRoute: "start",
          onGenerateRoute: (RouteSettings route) {
            switch (route.name) {
              default:
                return MaterialPageRoute(
                    builder: (context) => const StartScreen());
            }
          },
        );
      },
    );
  }
}
