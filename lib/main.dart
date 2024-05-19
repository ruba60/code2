import 'package:flutter/material.dart';

import 'package:ooo/views/medicile_inventory/home_page_inventory.dart';




void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageInventory(),
    );
  }
}



