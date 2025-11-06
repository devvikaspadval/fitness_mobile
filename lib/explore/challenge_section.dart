import 'package:flutter/material.dart';

import '../app_colors.dart';

class ChallengeSection extends StatelessWidget {
   ChallengeSection({super.key});

  final List<Map<String, dynamic>> challenges = [
    {
      "title": "Plank Challenge",
      "image": "images/challenge1.png",
      "backgroundColor": AppColors.colorPrimaryGreen,
      "textColor": AppColors.colorPrimaryBlack,
    },
    {
      "title": "Sprint Challenge",
      "image": "images/challenge2.png",
      "backgroundColor": AppColors.colorPrimaryBlack,
      "textColor": AppColors.colorWhite,
    },
    {
      "title": "Squat Challenge",
      "image": "images/challenge3.png",
      "backgroundColor": AppColors.colorWhite,
      "textColor": AppColors.colorPrimaryBlack,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Challenge",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(AppColors.colorPrimaryBlack),
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 110, // fixed height for challenge cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: challenges.length, // your challenge list
            itemBuilder: (context, index) {
              final challenge = challenges[index];
              return Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(challenge["backgroundColor"]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Background Image
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: Image.asset(
                    //     challenge["image"]!,
                    //     width: double.infinity,
                    //     height: double.infinity,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),

                    // Gradient Overlay
                     // Challenge Info
                    Positioned(
                      left: 12,
                      right: 12,
                      bottom: 12,
                      child: Text(
                        challenge["title"]!,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(challenge["textColor"])
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                    )
                  ],
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}
