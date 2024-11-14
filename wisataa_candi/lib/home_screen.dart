import 'package:flutter/material.dart';
import 'package:wisataa_candi/data/candi_data.dart';
import 'package:wisataa_candi/models/candi.dart';
import 'package:wisataa_candi/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 1: AppBar
      appBar: AppBar(
        title: Text('Wisata Candi'),
      ),
      //TODO 2: GridVieBuilder
      body: GridView.builder
      (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      padding: EdgeInsets.all(8),
      itemCount: candiList.length,
      itemBuilder: (context, index) {
        Candi candi = candiList[index];
        return ItemCard(
          candi: candi,
        ),
      }
      ),
      //TODO 3: iTEMcaRD
    );
  }
}