import 'package:flutter/material.dart';
import 'package:nexusbuild/Screens/homeScreen/Worker/worker.dart';
import 'package:nexusbuild/Screens/homeScreen/mainhomeScreen.dart';
import 'package:nexusbuild/Screens/otpScreen/otpScreen.dart';
import 'package:nexusbuild/Screens/signupScreen/signupScreen.dart';
import 'package:nexusbuild/Screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NexusBuild',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: WorkerScreen(),
    );
  }
}
