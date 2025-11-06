import 'package:fitnessapp/app_colors.dart';
import 'package:flutter/material.dart';

class BestForYouWidget extends StatelessWidget {
  const BestForYouWidget({super.key});

  final List<Map<String, String>> bestWorkouts = const [
    {
      "title": "Belly fat burner",
      "duration": "10 min",
      "level": "Beginner",
      "image": "images/best_for_you1.png",
    },
    {
      "title": "Lose Fat",
      "duration": "10 min",
      "level": "Beginner",
      "image": "images/best_for_you2.png",
    },
    {
      "title": "Plank",
      "duration": "5 min",
      "level": "Expert",
      "image": "images/best_for_you3.png",
    },
    {
      "title": "Build Whider",
      "duration": "30 min",
      "level": "Medium",
      "image": "images/best_for_you4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Text(
          "Best for you",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(AppColors.colorPrimaryBlack),
          ),
        ),
        const SizedBox(height: 10),

        // Grid of workouts
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bestWorkouts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4, // Adjust for card proportions
          ),
          itemBuilder: (context, index) {
            final workout = bestWorkouts[index];
            return Container(
              width: 194,
              height: 86,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    // Workout Image
                    ClipRRect(

                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        workout["image"]!,
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Workout Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            workout["title"]!,
                            style:  TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.colorPrimaryBlack)
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xffF1F1F1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              workout["duration"]!,
                              style:  TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(AppColors.colorPrimaryBlack).withOpacity(0.7)
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              workout["level"]!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
