import 'package:flutter/material.dart';

class NotApprovedScreen extends StatefulWidget {
  const NotApprovedScreen({super.key});

  @override
  State<NotApprovedScreen> createState() => _NotApprovedScreenState();
}

class _NotApprovedScreenState extends State<NotApprovedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/image/stopwatch.png",
              height: 58,
              width: 58,
            ),
          ),
          SizedBox(height: 24),

          Center(
            child: Text(
              "Your documents have been correctly submitted to the admin.Wait for admin approval. Admin will send you a notification if any documents are required.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF686868),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
