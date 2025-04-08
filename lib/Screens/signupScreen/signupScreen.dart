import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexusbuild/Screens/otpScreen/otpScreen.dart';
import 'package:nexusbuild/cubit/auth_cubit/auth_cubit.dart';
import 'package:nexusbuild/cubit/auth_cubit/auth_state.dart';
// import 'package:nexusbuild/cubits/auth_cubit/auth_cubit.dart';
// import 'package:nexusbuild/cubits/auth_cubit/auth_state.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthCodeSent) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpScreen()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Stack(children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 50),
                    Image.asset('assets/images/tower.png', height: 100),
                    SizedBox(height: 30),
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 50, 50, 50)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Nexus",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: "NAME",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Mobile/Number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your mobile number';
                                } else if (value.length != 10) {
                                  return 'Mobile number should be 10 digits';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: state is AuthLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        final phone =
                                            mobileController.text.trim();
                                        context
                                            .read<AuthCubit>()
                                            .sendOtp(phone);
                                      }
                                    },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50),
                                child: state is AuthLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white, strokeWidth: 2)
                                    : Text("Sign In/Up"),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text("OR", style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/google.png',
                                    height: 40),
                                SizedBox(width: 30),
                                Image.asset('assets/images/facebook.png',
                                    height: 40),
                                SizedBox(width: 30),
                                Image.asset('assets/images/twitter.png',
                                    height: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
