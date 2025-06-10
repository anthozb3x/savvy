import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: 1), // Provider factice, à remplacer plus tard
      ],
      child: MaterialApp.router(
        title: 'Savvy App',
        routerConfig: appRouter,
      ),
    );
  }
}
