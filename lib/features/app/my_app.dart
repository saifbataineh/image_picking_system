import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/views/file_picking_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FilePickingPage(),
    );
  }
}
