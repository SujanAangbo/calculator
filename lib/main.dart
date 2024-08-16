import 'package:calculator/core/theme/app_theme.dart';
import 'package:calculator/features/home/home_page.dart';
import 'package:calculator/features/home/provider/calculation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalculationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dartTheme,
        home: const HomePage(),
      ),
    );
  }
}
