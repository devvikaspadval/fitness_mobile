import 'package:flutter/material.dart';

import '../app_colors.dart';

class FastWarmupWidget extends StatelessWidget {
   FastWarmupWidget({super.key});

  final List<Map<String, String>> warmUps = [
    {
      "title": "Leg exercises",
      "duration": "10 min",
      "level": "Beginner",
      "image": "images/fast_warmup1.png",
    },
    {
      "title": "Backward lunges",
      "duration": "5 min",
      "level": "Beginner",
      "image": "images/fast_warmup2.png",
    },
    {
      "title": "Arm Circles",
      "duration": "4 min",
      "level": "Pro",
      "image": "images/fast_warmup1.png",
    },
    {
      "title": "Butt Kicks",
      "duration": "8 min",
      "level": "Medium",
      "image": "images/fast_warmup2.png",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Fast Warm Up",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(AppColors.colorPrimaryBlack),
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: warmUps.length, // your warm-up list
            itemBuilder: (context, index) {
              final warmup = warmUps[index];
              return Container(
                width: 190,
                height: 86,
                margin: const EdgeInsets.only(right: 12),
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
                          warmup["image"]!,
                          width: 66,
                          height: 66,
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
                              warmup["title"]!,
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
                                warmup["duration"]!,
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
                                warmup["level"]!,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(AppColors.colorPrimaryBlack).withOpacity(0.7),
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
        ),
      ],
    );
  }
}
