import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            context.go(
              '/lesson/096'
              '?num2=14~15'
              '&pPage=96~97'
              '&phase=${Uri.encodeComponent('차시 시작')}',
            );
          },
          child: const Text('096 차시로 이동'),
        ),
      ),
    );
  }
}
