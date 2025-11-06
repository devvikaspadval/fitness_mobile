import 'package:fitnessapp/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

import '../model/today_plan_data.dart';

class TodayPlanSection extends StatelessWidget {
  const TodayPlanSection({super.key});

  @override
  Widget build(BuildContext context) {
    final plans = <TodayPlanData>[
      TodayPlanData(
        title: 'Push Up',
        subtitle: '100 Push up a day',
        imagePath: 'images/today_plan1.png',
        level: 'Expert',
        progress: 0.45,
      ),
      TodayPlanData(
        title: 'Sit Up',
        subtitle: '20 Sit up a day',
        imagePath: 'images/today_plan2.png',
        level: 'Beginner',
        progress: 0.75,
      ),
      TodayPlanData(
        title: 'Knee Push Up',
        subtitle: '10 a day',
        imagePath: 'images/today_plan3.png',
        level: 'Beginner',
        progress: 0.20,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Text(
          'Today Plan',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF192126),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            itemCount: plans.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (_, i) => TodayPlanCard(plan: plans[i]),
          ),
        ),
      ],
    );
  }
}



class TodayPlanCard extends StatelessWidget {
  final TodayPlanData plan;
  final VoidCallback? onTap;

  const TodayPlanCard({super.key, required this.plan, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Card
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 350,
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(AppColors.colorWhite),
              borderRadius: BorderRadius.circular(23),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Left image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    plan.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // Right content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        plan.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(AppColors.colorPrimaryBlack),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Subtitle
                      Text(
                        plan.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(AppColors.colorPrimaryBlack).withOpacity(0.5),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Progress bar with percent text (pill style)
                      LinearPercentIndicator(
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent:plan.progress,
                        center: Text("${plan.progress * 100} %",style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w500,fontSize: 8,color: Color(AppColors.colorPrimaryBlack)),),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color(AppColors.colorPrimaryGreen),
                        backgroundColor: Color(AppColors.colorRemainingProgress),
                        barRadius: Radius.circular(3),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Level tag (top-right, outside padding)
        Positioned(
          left: 270,

          child: _LevelTag(text: plan.level),
        ),
      ],
    );
  }
}

class _LevelTag extends StatelessWidget {
  final String text;
  const _LevelTag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2,right: 8,bottom: 2, left: 8),
      decoration: BoxDecoration(
        color:  Color(AppColors.colorPrimaryBlack),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6.0), bottomRight: Radius.circular(6.0))
      ),
      child: IntrinsicWidth(
        child: Text(
          text,
          style:  TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(AppColors.colorWhite),
          ),
        ),
      ),
    );
  }
}

/// Custom progress pill to mimic the screenshot:
/// - light gray track
/// - lime green filled portion with % text centered inside the filled area
class _ProgressPill extends StatelessWidget {
  final double progress;     // 0..1
  final String percentText;  // e.g. "45%"

  const _ProgressPill({
    required this.progress,
    required this.percentText,
  });

  @override
  Widget build(BuildContext context) {
    const trackHeight = 18.0;
    Color lime = Color(AppColors.colorPrimaryGreen); // neon/lime like screenshot

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final fillWidth = (totalWidth * progress).clamp(0, totalWidth) as double;

        return Container(
          height: 16,
          decoration: BoxDecoration(
            color:  Color(AppColors.colorPrimaryGreen),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Stack(
            children: [
              // Filled part
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: fillWidth,
                decoration: BoxDecoration(
                  color: lime,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              // Percent text centered within filled area; if very small, keep readable
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: fillWidth < 44 ? 44 : fillWidth,
                    child: Center(
                      child: Text(
                        percentText,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          //color: fillWidth < 44 ? Colors.black : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
