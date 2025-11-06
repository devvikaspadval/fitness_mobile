import 'package:fitnessapp/app_colors.dart';
import 'package:flutter/material.dart';

class TimeBurnSection extends StatelessWidget {
  const TimeBurnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 258,
      height: 64,
      decoration: BoxDecoration(
        color: Color(AppColors.colorPrimaryBlack).withOpacity(0.3),
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _InfoPill(icon: Icons.timer_outlined, label: '20 min', title: 'Time'),
          const SizedBox(width: 16), // spacing between Time and Burn

          VerticalDivider(color: Color(AppColors.colorWhite).withOpacity(0.25),indent: 7,endIndent: 7,),
          // Burn section
          _InfoPill(
            icon: Icons.local_fire_department_outlined,
            label: '95 kcal',
            title: 'Burn',
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;
  final String title;

  const _InfoPill({
    required this.icon,
    required this.label,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center, // Align row children vertically
      children: [
        // Icon
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Color(AppColors.colorPrimaryGreen), // Dark background
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(icon, size: 18, color: Color(AppColors.colorBlack)),
        ),
        const SizedBox(width: 8),
        // Texts for Title and Value
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically in Column
          children: [
            Text(
              title,
              style:  TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style:  TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(AppColors.colorPrimaryGreen),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

