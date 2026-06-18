import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCircleButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  final Color backgroundColor;
  final double size;

  const AppCircleButton({
    super.key,
    required this.assetPath,
    required this.onTap,
    this.backgroundColor = const Color(0xFFE2E2E2),
    this.size = 44.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}