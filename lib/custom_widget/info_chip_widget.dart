import 'package:flutter/material.dart';

import '../app_colors.dart';

class InfoChipWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoChipWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(9),
      ),
      child: IntrinsicWidth(
        child: Row(
          children: [
            Icon(icon, size: 16, color:  Color(AppColors.colorBlack)),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(AppColors.colorPrimaryBlack),
              ),
            ),
          ],
        ),
      ),
    );
  }
}