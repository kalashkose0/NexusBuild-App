import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final String _mockOtp = '1234';

  void sendOtp(String phoneNumber) async {
    emit(AuthLoading());
    await Future.delayed(Duration(seconds: 2)); // mock delay
    emit(AuthCodeSent(phoneNumber));
  }

  void verifyOtp(String enteredOtp) {
    if (enteredOtp == _mockOtp) {
      emit(AuthVerified());
    } else {
      emit(AuthError("Invalid OTP, please try again"));
    }
  }

  void reset() {
    emit(AuthInitial());
  }
}
