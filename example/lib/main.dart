import 'package:flutter/material.dart';
import 'package:liquid_glass_ui/liquid_glass_ui.dart';
import 'package:example/beautiful_liquid_example.dart';

void main() {
  runApp(const LiquidGlassDemoApp());
}

class LiquidGlassDemoApp extends StatelessWidget {
  const LiquidGlassDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquid Glass UI Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const BeautifulLiquidExample(),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.grey.shade100,
      body: Center(
        child: LiquidGlassContainer(
          blur: 18,
          opacity: 0.2,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.water_drop_rounded, size: 40, color: Colors.white),
              SizedBox(height: 12),
              Text(
                'Liquid Glass UI',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 