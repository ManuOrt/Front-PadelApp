import 'package:flutter/material.dart';
import 'package:front_end_padelapp/providers/trainers_provider.dart';
import 'package:front_end_padelapp/routes/routes.dart';
import 'package:front_end_padelapp/utils/app_colors.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => UsersProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TrainersProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaddleHub',
      initialRoute: 'home',
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
      ),
    );
  }
}
