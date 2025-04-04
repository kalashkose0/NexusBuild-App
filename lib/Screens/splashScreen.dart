import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nexusbuild/Screens/signupScreen/signupScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Right Semi-Circle
          Positioned(
            top: -50,
            right: -50,
            child: ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.amber,
              ),
            ),
          ),

          // Bottom Left Semi-Circle
          Positioned(
            bottom: -60,
            left: -60,
            child: ClipOval(
              child: Container(
                width: 180,
                height: 180,
                color: Colors.amber,
              ),
            ),
          ),

          // Centered Logo and Text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/tower.png', height: 100),

                SizedBox(height: 10),

                // App Name "deeps"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Nexus",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Build",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),

                Text(
                  "Central Hub For Construction Professionals",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
