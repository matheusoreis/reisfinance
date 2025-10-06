import 'package:flutter/material.dart';

class SplashPageStore {
  Future<void> start(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/intro');
    }
  }
}
