import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/app.dart';
import 'package:provider_example/features/home/application/theme_service.dart';
import 'package:provider_example/features/home/application/user_service.dart';
import 'package:provider_example/features/home/data/mock/mock_user_data_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final userRepository = MockUserDataRepository();
    
  runApp(MultiProvider(providers: [

    /// UserService
    ChangeNotifierProvider(
      create: (_) => UserService(userRepository)),

    /// ThemeService
    ChangeNotifierProvider(
      create: (_) => ThemeService()),


  ], child: const App(),));
}
