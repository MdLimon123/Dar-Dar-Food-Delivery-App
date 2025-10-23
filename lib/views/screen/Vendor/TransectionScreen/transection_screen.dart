import 'package:dar_dar_foodd_delivery_app/views/base/vendor_bottom_menu..dart';
import 'package:flutter/material.dart';

class TransectionScreen extends StatefulWidget {
  const TransectionScreen({super.key});

  @override
  State<TransectionScreen> createState() => _TransectionScreenState();
}

class _TransectionScreenState extends State<TransectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Transection Screen"),
      ),
      bottomNavigationBar: VendorBottomMenu(1),
    );
  }
}

