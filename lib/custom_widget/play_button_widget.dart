import 'package:flutter/material.dart';

import '../app_colors.dart';

class PlayButtonWidget extends StatelessWidget {
  final void Function()? onPressed;

  const PlayButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 38,
        height: 38,
        decoration:  BoxDecoration(
          color: Color(AppColors.colorPrimaryGreen), // lime/neo green from screenshot
          shape: BoxShape.circle,
        ),
        child:  Icon(
          Icons.play_arrow_rounded,
          color: Color(AppColors.colorBlack),
          size: 28,
        ),
      ),
    );
  }
}