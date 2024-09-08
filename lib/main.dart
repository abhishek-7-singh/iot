import 'package:farm_monitoring_app/screens/dashboard_screen.dart';
import 'package:farm_monitoring_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
// import 'package:iot/screens/login_screen.dart';
// import 'package:iot/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
