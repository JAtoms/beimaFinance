
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../api_service/auth/auth_api.dart';
import '../../../helpers/helpers.dart';

class AuthState {
  bool isLoading;

  AuthState({required this.isLoading});
}

class AuthCubit extends Cubit<AuthState> {
  AuthServiceImp authServiceImp;

  AuthCubit({required this.authServiceImp})
      : super(AuthState(isLoading: false));

  void setLoading(bool isLoading) {
    emit(AuthState(isLoading: isLoading));
  }

  void signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required BuildContext context}) async {
    showLoaderDialog(context);
    authServiceImp.signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        context: context);
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    showLoaderDialog(context);
    authServiceImp.login(password: password, email: email, context: context);
  }
}
