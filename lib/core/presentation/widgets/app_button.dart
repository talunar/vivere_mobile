import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary, outline }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonVariant variant;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 352),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: _getStyle(),
          child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }

  ButtonStyle _getStyle() {
    switch (variant) {
      case AppButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE2E2E2),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 0,
        );
      case AppButtonVariant.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFFFF5900),
          side: const BorderSide(color: Color(0xFFFF5900), width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 0,
        );
      case AppButtonVariant.primary:
      default:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF5900),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 0,
        );
    }
  }
}