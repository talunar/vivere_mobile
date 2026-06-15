import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showAdd;
  final bool showArrow;
  final VoidCallback? onArrowTap;
  final VoidCallback? onAddTap;
  final double? bottomPadding;

  const DashboardCard({
    super.key,
    required this.title,
    required this.child,
    this.showAdd = false,
    this.showArrow = false,
    this.onArrowTap,
    this.onAddTap,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 10,
        right: 8,
        top: 10,
        bottom: bottomPadding ?? 4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE2E2E2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showAdd)
                      GestureDetector(
                        onTap: onAddTap,
                        child: const Icon(Icons.add_circle, size: 36, color: Colors.black),
                      ),
                    if (showArrow) ...[
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: onArrowTap,
                        behavior: HitTestBehavior.opaque,
                        child: const Icon(Icons.arrow_circle_right, size: 36, color: Colors.black),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
