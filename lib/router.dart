import 'package:go_router/go_router.dart';
import 'package:sampletest/home_screen.dart';
import 'package:sampletest/lesson_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    GoRoute(
      // 예: /lesson/096?num2=14~15&pPage=96~97&phase=차시%20시작
      path: '/lesson/:href',
      builder: (_, state) {
        final href = state.pathParameters['href']!;
        final qp = state.uri.queryParameters;
        final num2 = qp['num2'] ?? '';
        final pPage = qp['pPage'] ?? '';
        final phase = qp['phase'] ?? '';
        return LessonScreen(href: href, num2: num2, pPage: pPage, phase: phase);
      },
    ),
  ],
);
