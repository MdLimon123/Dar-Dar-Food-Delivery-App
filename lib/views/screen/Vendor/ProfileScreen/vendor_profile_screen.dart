import 'package:dar_dar_foodd_delivery_app/views/base/vendor_bottom_menu..dart';
import 'package:flutter/material.dart';

class VendorProfileScreen extends StatefulWidget {
  const VendorProfileScreen({super.key});

  @override
  State<VendorProfileScreen> createState() => _VendorProfileScreenState();
}

class _VendorProfileScreenState extends State<VendorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Screen"),
      ),
      bottomNavigationBar: VendorBottomMenu(3),
    );
  }
}
