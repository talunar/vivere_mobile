import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? message;
  final String confirmText;
  final VoidCallback onConfirm;
  final Widget? content;

  const AppDialog({
    super.key,
    required this.title,
    this.message,
    required this.confirmText,
    required this.onConfirm,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 352),
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            if (message != null) ...[const SizedBox(height: 16), Text(message!, style: const TextStyle(color: Color(0xFF9E9E9E)))],
            if (content != null) ...[const SizedBox(height: 20), content!],
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Отмена", style: TextStyle(color: Colors.grey)),
                ),
                TextButton(
                  onPressed: () {
                    onConfirm();
                  },
                  child: Text(confirmText, style: const TextStyle(color: Color(0xFFFF5900), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}