import 'package:flutter/material.dart';

class Mainhomescreen extends StatelessWidget {
  const Mainhomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ],
    ));
  }
}
