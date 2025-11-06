import 'package:fitnessapp/app_colors.dart';
import 'package:fitnessapp/custom_widget/play_button_widget.dart';
import 'package:flutter/material.dart';

import '../model/popular_work_data.dart';
import 'info_chip_widget.dart';

class PopularWorkoutCard extends StatelessWidget {
  final PopularWorkoutData data;
  final void Function()? onTap;

  const PopularWorkoutCard({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9, // nice wide card
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Image.asset(
                data.imagePath,
                fit: BoxFit.cover,
              ),

              // Dark gradient overlay (left to right)
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff353535), // darker on left
                      Color(0xff4B4B4B00), // softer on right

                    ],
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              data.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 22,
                                height: 1.1,
                                fontWeight: FontWeight.w700,
                                color: Color(AppColors.colorWhite),
                              ),
                            ),
                          ),
                        ),

                        // Chips row
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InfoChipWidget(
                              icon: Icons.local_fire_department_rounded,
                              label: '${data.kcal} Kcal',
                            ),
                            SizedBox(height: 8,),

                            InfoChipWidget(
                              icon: Icons.access_time_rounded,
                              label: '${data.minutes} Min',
                            ),

                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PlayButtonWidget(
                          onPressed: onTap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



