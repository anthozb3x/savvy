import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/counter_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>().count;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<CounterProvider>().increment(),
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/details'),
              child: const Text('Go to details'),
            ),
          ],
        ),
      ),
    );
  }
}
