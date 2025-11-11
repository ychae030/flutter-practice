import 'package:flutter/material.dart';
import '../html_viewer.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({
    super.key,
    required this.href,
    required this.num2,
    required this.pPage,
    required this.phase,
  });
  final String href, num2, pPage, phase;

  @override
  Widget build(BuildContext context) {
    final src = 'assets/html/$href.html';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (num2.isNotEmpty) _chip(num2),
            if (pPage.isNotEmpty) ...[
              const SizedBox(width: 6),
              _chip('p.$pPage'),
            ],
            const SizedBox(width: 8),
            Text(phase.isNotEmpty ? phase : '차시'),
          ],
        ),
      ),
      body: HtmlViewer(src: src),
    );
  }

  Widget _chip(String t) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xffCEEFE7),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(t, style: const TextStyle(color: Color(0xff22b99c))),
  );
}
