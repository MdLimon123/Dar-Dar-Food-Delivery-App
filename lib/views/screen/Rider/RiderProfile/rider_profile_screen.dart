import 'package:dar_dar_foodd_delivery_app/views/base/rider_bottom_menu..dart';
import 'package:flutter/material.dart';

class RiderProfileScreen extends StatefulWidget {
  const RiderProfileScreen({super.key});

  @override
  State<RiderProfileScreen> createState() => _RiderProfileScreenState();
}

class _RiderProfileScreenState extends State<RiderProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RiderBottomMenu(3),
    );
  }
}
