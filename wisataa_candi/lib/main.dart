import 'package:flutter/material.dart';
import 'package:wisataa_candi/data/candi_data.dart';
import 'package:wisataa_candi/detail_screen.dart';
import 'package:wisataa_candi/home_screen.dart';
import 'package:wisataa_candi/profile_screen.dart';
import 'package:wisataa_candi/search_screen.dart';

import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     iconTheme: IconThemeData(color: Colors.deepPurple),
      //     titleTextStyle: TextStyle(
      //       color: Colors.deepPurple,
      //       fontSize: 28,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple).copyWith(
      //     primary: Colors.deepPurple,
      //     surface: Colors.deepPurple[50],
      //   ),
      // ),

      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //TODO 1: Deklarasi Variabel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2: body
      //TODO 3: butto,NavigationBar
      //TODO 4: child Theme
    );
  }
}
