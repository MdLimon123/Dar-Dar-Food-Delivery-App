import 'package:dar_dar_foodd_delivery_app/views/base/rider_bottom_menu..dart';
import 'package:flutter/material.dart';

class RiderNotificationScreen extends StatefulWidget {
  const RiderNotificationScreen({super.key});

  @override
  State<RiderNotificationScreen> createState() => _RiderNotificationScreenState();
}

class _RiderNotificationScreenState extends State<RiderNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RiderBottomMenu(2),
    );
  }
}
