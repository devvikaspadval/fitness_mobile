import 'package:fitnessapp/app_colors.dart';
import 'package:fitnessapp/custom_widget/lower_body_training.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(AppColors.colorPrimaryBlack),
      appBar: AppBar(
        backgroundColor: Color(AppColors.colorPrimaryBlack),
        title: Text("Workout",style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(AppColors.colorWhite),
          letterSpacing: 0.2,
        ),),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }, icon: Icon(Icons.arrow_back_ios_new,color: Color(AppColors.colorWhite),),
      )),
      body: LowerBodyTraining(),
    );
  }
}




