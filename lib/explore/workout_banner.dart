import 'package:flutter/material.dart';

import '../app_colors.dart';

class WorkoutBanner extends StatelessWidget {
  const WorkoutBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        image: const DecorationImage(
          image: AssetImage("images/quartine_workout.png"), // your asset
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Best Quarantine\nWorkout",
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),

                Row(
                  children:  [
                    Text(
                      "See more",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(AppColors.colorPrimaryGreen)
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.lightGreenAccent,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}