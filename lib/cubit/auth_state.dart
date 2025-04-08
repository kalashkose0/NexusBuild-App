//   import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nexusbuild/cubit/auth_cubit/auth_cubit.dart';
// import 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

//   String _storedOtp = "1234"; // Fake OTP for testing

//   void sendOtp(String phoneNumber) async {
//     emit(AuthLoading());

//     // Simulate sending OTP
//     await Future.delayed(Duration(seconds: 2));

//     // You can later replace this with Firebase Auth or API call
//     emit(AuthCodeSent(phoneNumber));
//   }

//   void verifyOtp(String enteredOtp) {
//     if (enteredOtp == _storedOtp) {
//       emit(AuthVerified());
//     } else {
//       emit(AuthError("Invalid OTP"));
//     }
//   }

//   void reset() {
//     emit(AuthInitial());
//   }
// }
