import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexusbuild/Screens/homeScreen/mainhomeScreen.dart';
import 'package:nexusbuild/cubit/auth_cubit/auth_cubit.dart';
import 'package:nexusbuild/cubit/auth_cubit/auth_state.dart';
// import 'package:nexusbuild/cubits/auth_cubit/auth_cubit.dart';
// import 'package:nexusbuild/cubits/auth_cubit/auth_state.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthVerified) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Mainhomescreen()),
              (route) => false,
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // Top Right & Bottom Left Design
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

              // Body
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/tower.png', height: 100),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nexus",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        SizedBox(width: 5),
                        Text("Build",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Connecting Builders with Vision",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Enter 4-digit OTP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    // OTP Input Field
                    TextField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '----',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 40),

                    // NEXT Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              final otp = otpController.text.trim();
                              if (otp.length == 4) {
                                context.read<AuthCubit>().verifyOtp(otp);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Enter a valid 4-digit OTP')),
                                );
                              }
                            },
                      child: state is AuthLoading
                          ? CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2)
                          : Text("Next"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
