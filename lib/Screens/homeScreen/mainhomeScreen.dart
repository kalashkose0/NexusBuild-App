import 'package:flutter/material.dart';

class Mainhomescreen extends StatefulWidget {
  const Mainhomescreen({super.key});

  @override
  State<Mainhomescreen> createState() => _MainhomescreenState();
}

class _MainhomescreenState extends State<Mainhomescreen> {
  bool _agreedToTerms = false;

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

          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/images/tower.png',
                    height: 100,
                  ),
                  SizedBox(height: 30),

                  // Welcome Caption
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      text: 'Nexus',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Build',
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Central Hub for Construction & Collaboration',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  // Terms & Conditions Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: _agreedToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreedToTerms = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms & Conditions',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Button: Civil Engineer
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _agreedToTerms
                          ? () {
                              // Navigate to Civil Engineer screen
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Continue as Civil Engineer / सिविल इंजीनियर',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Button: Worker
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _agreedToTerms
                          ? () {
                              // Navigate to Worker screen
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Continue as Worker / मिस्त्री / मज़दूर',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
