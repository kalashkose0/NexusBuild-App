import 'package:flutter/material.dart';
import 'package:nexusbuild/Screens/otpScreen/otpScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/tower.png', height: 100),
              ),
              SizedBox(height: 30),
              Text(
                "Welcome to",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 50, 50, 50)),
              ),
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
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "NAME ",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.numberWithOptions(),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Mobile/Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Text("Sign In/Up"),
                ),
              ),
              SizedBox(height: 20),
              Text("OR", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'assets/images/google.png',
                      fit: BoxFit.contain, // Important!
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'assets/images/facebook.png',
                      fit: BoxFit.contain, // Important!
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'assets/images/twitter.png',
                      fit: BoxFit.contain, // Important!
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
