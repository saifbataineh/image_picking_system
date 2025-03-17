import 'package:flutter/material.dart';

class ShowSnackBarService {
  static showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          backgroundColor: Colors.red, content: Text("didn't select any data")),
    );
  }
}
