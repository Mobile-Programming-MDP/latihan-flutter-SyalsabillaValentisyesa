import 'package:flutter/material.dart';
import 'package:wisataa_candi/data/candi_data.dart';
import 'package:wisataa_candi/detail_screen.dart';
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
      // home: DetailScreen(
      //   candi: candiList[0],
      // )ooowww
      home: SearchScreen(),
    );
  }
}
