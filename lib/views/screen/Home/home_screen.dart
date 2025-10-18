import 'package:dar_dar_foodd_delivery_app/views/base/bottom_menu..dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomMenu(0),
    );
  }
}
