import 'package:flutter/material.dart';
import 'package:front_end_padelapp/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'onboarding', 
      routes: customRoutes,
    );
  }
}