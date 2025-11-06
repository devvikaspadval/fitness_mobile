import 'package:fitnessapp/screens/workout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../custom_widget/popular_workout_card.dart';
import '../custom_widget/today_plan_section.dart';
import '../model/popular_work_data.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});


  final items = [
    PopularWorkoutData(
      title: 'Lower Body\nTraining',
      imagePath: 'images/lowe_body_training.png', // or NetworkImage
      kcal: 500,
      minutes: 50,
    ),
    PopularWorkoutData(
      title: 'Hand &\nShoulder\nTraining',
      imagePath: 'images/lowe_body_training.png',
      kcal: 600,
      minutes: 40,
    ),
    PopularWorkoutData(
      title: 'Core\nBurn',
      imagePath: 'images/lowe_body_training.png',
      kcal: 450,
      minutes: 30,
    ),
  ];

  String _getGreeting() {
    int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning 🔥";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon ☀️";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening 🌆";
    } else {
      return "Good Night 🌙";
    }
  }

  SizedBox headingUI() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getGreeting(),
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              color: Color(AppColors.colorPrimaryBlack),
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "Vikas Padval",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w800,
              color: Color(AppColors.colorPrimaryBlack),
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }

  Container searchUI() {
    return Container(
      width: 350,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: const Icon(CupertinoIcons.search, color: Colors.grey),
          hintText: "Search",
          hintStyle: const TextStyle(
            fontSize: 14,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget workOutUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Workouts',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(AppColors.colorPrimaryBlack),
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(
          height: 174, // card height
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, i) => PopularWorkoutCard(data: items[i],onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WorkoutScreen()));
            },),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headingUI(),
            const SizedBox(height: 20),
            searchUI(),
            const SizedBox(height: 20),
            workOutUI(context),
            Expanded(child: TodayPlanSection())
          ],
        ),
      ),
    );
  }
}
