import 'package:fitnessapp/explore/best_for_you_widget.dart';
import 'package:fitnessapp/explore/fast_warmup_widget.dart';
import 'package:fitnessapp/explore/workout_banner.dart';
import 'package:flutter/material.dart';

import '../explore/challenge_section.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [WorkoutBanner(), SizedBox(height: 15), BestForYouWidget(),SizedBox(height: 15,), ChallengeSection(),SizedBox(height: 15,),FastWarmupWidget()],
          ),
        ),
      ),
    );
  }
}
