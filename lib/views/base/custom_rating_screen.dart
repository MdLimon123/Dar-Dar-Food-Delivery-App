import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingPill extends StatelessWidget {
  final double rating;
  final int count;

  const RatingPill({
    super.key,
    required this.rating,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset("assets/icons/star.svg"),
          const SizedBox(width: 5),
          Text(
            '$rating ($count)',
            style:  TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.textColor
            ),
          ),
        ],
      ),
    );
  }
}