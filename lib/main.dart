import 'package:flutter/material.dart';
import 'package:front_end_padelapp/routes/routes.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AuthProvider authProvider = AuthProvider();
  UsersProvider usersProvider = UsersProvider();
  TrainersProvider trainersProvider = TrainersProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(
          value: authProvider,
        ),
        ChangeNotifierProvider<UsersProvider>.value(
          value: usersProvider,
        ),
        ChangeNotifierProvider<TrainersProvider>.value(
          value: trainersProvider,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaddleHub',
      initialRoute: 'login',
      routes: customRoutes,
      theme: ThemeData(
        primaryColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.primary,
            selectionColor: AppColors.primary,
            selectionHandleColor: AppColors.primary),
      ),
    );
  }
}
