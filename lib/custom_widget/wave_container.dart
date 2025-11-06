import 'package:flutter/material.dart';

class WaveContainer extends StatelessWidget {
  const WaveContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        width: 132, // adjust width
        height: 41.5, // adjust height
        color: Color(0xff95CCE3),
        // water color
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.6);

    // First wave
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.4, // control point
      size.width * 0.5, size.height * 0.6,  // end point
    );

    // Second wave
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.8,
      size.width, size.height * 0.6,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
