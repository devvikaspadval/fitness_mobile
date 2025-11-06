import 'package:fitnessapp/app_colors.dart';
import 'package:fitnessapp/custom_widget/time_burn_widget.dart';
import 'package:flutter/material.dart';

class LowerBodyTraining extends StatefulWidget {
  const LowerBodyTraining({super.key});

  @override
  State<LowerBodyTraining> createState() => _LowerBodyTrainingState();
}

class _LowerBodyTrainingState extends State<LowerBodyTraining> {
  final List<Map<String, String>> workouts = const [
    {
      'name': 'Jumping Jacks',
      'duration': '00:30',
      'image': 'images/jumping_jacks.png',
    },
    {
      'name': 'Squats',
      'duration': '01:00',
      'image': 'images/squats.png',
    },
    {
      'name': 'Push Ups',
      'duration': '02:30',
      'image': 'images/biceps.png',
    },
    {
      'name': 'Squats',
      'duration': '01:00',
      'image': 'images/squats.png',
    },
    {
      'name': 'Push Ups',
      'duration': '02:30',
      'image': 'images/biceps.png',
    },
    {
      'name': 'Squats',
      'duration': '01:00',
      'image': 'images/squats.png',
    },
    {
      'name': 'Push Ups',
      'duration': '02:30',
      'image': 'images/biceps.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Main scrollable content
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with overlay
              Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('images/lowe_body_training.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                  // Dark overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ),
                  // TimeBurnSection on image

                ],
              ),
              const SizedBox(height: 40),

              Text(
                "Lower Body Training",
                style: TextStyle(
                  color: Color(AppColors.colorWhite),
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'The lower abdomen and hips are the most difficult areas of the body to reduce when we are on a diet. '
                    'Even so, in this area, especially the legs as a whole, you can reduce weight even if you don\'t use tools.',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rounds",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: '1',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '/${workouts.length}',
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              /// List of workouts
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100), // leave space for button
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    final workout = workouts[index];
                    return Container(
                      height: 74,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xff384046),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset(
                              workout['image']!,
                              width: 58,
                              height: 58,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  workout['name']!,
                                  style: const TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  workout['duration']!,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 28,
                            height: 28,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(AppColors.colorPrimaryBlack),
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Color(AppColors.colorPrimaryGreen),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),


        const Positioned(
          top: 240,
          left: 66,

          child: TimeBurnSection(),
        ),
        /// Floating "Let's Workout" button
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(AppColors.colorPrimaryGreen),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Text(
                "Lets Workout",
                style: TextStyle(
                  color: Color(AppColors.colorPrimaryBlack),
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
