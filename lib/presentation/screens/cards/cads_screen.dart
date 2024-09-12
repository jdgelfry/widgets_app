import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen'; //name is used in app_router.dart
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: const Placeholder(),
    );
  }
}
