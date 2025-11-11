import 'package:flutter/material.dart';

class LessonBottomBar extends StatelessWidget {
  const LessonBottomBar({super.key, required this.currentPhase});
  final String currentPhase;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE8F3F0))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu, color: Colors.teal),
            Text(
              currentPhase.isNotEmpty ? currentPhase : '단계 없음',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.chevron_right, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}
