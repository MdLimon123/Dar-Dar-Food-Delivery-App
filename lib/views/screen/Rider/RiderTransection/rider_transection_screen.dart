import 'package:dar_dar_foodd_delivery_app/views/base/rider_bottom_menu..dart';
import 'package:flutter/material.dart';

class RiderTransectionScreen extends StatefulWidget {
  const RiderTransectionScreen({super.key});

  @override
  State<RiderTransectionScreen> createState() => _RiderTransectionScreenState();
}

class _RiderTransectionScreenState extends State<RiderTransectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RiderBottomMenu(1),
    );
  }
}
