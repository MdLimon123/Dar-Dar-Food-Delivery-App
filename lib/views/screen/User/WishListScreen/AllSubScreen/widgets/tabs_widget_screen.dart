import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TabsWidgetScreen extends StatelessWidget {
  final bool isSelected;
  final String tabName;
  final VoidCallback onTap;
  final int? notificationCount;

  const TabsWidgetScreen({
    super.key,
    required this.isSelected,
    required this.tabName,
    required this.onTap,
    this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust vertical padding for spacing
        margin: EdgeInsets.symmetric(horizontal: 10),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ?Color(0xFF89B12C):Color(0xFFDEECBF),
          borderRadius: BorderRadius.circular(100),
          border: isSelected
              ? Border(
            bottom: BorderSide(
              color: Color(0xFFDEECBF),
              width: 2.0, // Underline thickness
            ),
          )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tabName,
              style: TextStyle(
                color: isSelected ? Color(0xFFF7F7F7) : Color(0xFF6B8A22),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

          ],
        ),
      ),
    );
  }
}