import 'package:ecogestion_app/ventanas/home_screen.dart';
import 'package:ecogestion_app/ventanas/organico_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecogestion_app/ventanas/login_screen.dart';

void main() {
  runApp(const EcogestionApp());
}

class EcogestionApp extends StatelessWidget {
  const EcogestionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoGestión',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // pantalla inicial
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/organico': (context) => const OrganicoScreen(),
      },
    );
  }
}