import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnessapp/app_colors.dart';
import 'package:fitnessapp/screens/home_screen.dart';
import 'package:fitnessapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.colorWhite),
      body: Column(
        children: [
          CarouselSlider(
            // options: CarouselOptions(height: 400.0),
              items: [1].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: double.infinity, // fills width → text below aligns left to this
                      height: 565,
                      child: Image.asset(
                        'images/onboarding_image1.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 565,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.0,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              )),
          SizedBox(height: 9,),
          SizedBox(width:270, height:58, child: Text("Wherever You Are Health Is Number One",style: TextStyle(color: Color(AppColors.colorPrimaryBlack),fontFamily: 'Lato',fontWeight: FontWeight.w800,fontSize: 24.0,letterSpacing: 0,height:1.3),textAlign: TextAlign.center,)),
          SizedBox(height: 16,),
          SizedBox(width:257, height:18, child: Text("There is no instant way to a healthy life",style: TextStyle(color: Color(AppColors.colorPrimaryBlack),fontFamily: 'Lato',fontWeight: FontWeight.w400,fontSize: 15.0,letterSpacing: 0),textAlign: TextAlign.center,)),
          Spacer(),
          Container(
            width: 350.0,
            height: 56,
            margin: EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(AppColors.colorPrimaryBlack),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                    color: Color(AppColors.colorWhite),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0,
                    fontSize: 16.0,
                    fontFamily: 'Lato'
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
