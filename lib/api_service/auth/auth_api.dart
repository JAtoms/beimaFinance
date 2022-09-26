import 'dart:async';
import 'dart:convert';


import 'package:beima/api_service/service.dart';
import 'package:beima/dependency/navigation/global_routes.dart';
import 'package:beima/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../database/shared_preferences.dart';

abstract class AuthService {
  Future<void> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required BuildContext context});

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context});
}

class AuthServiceImp extends AuthService {
  ServiceHelpersImp serviceHelpersImp;
  TempDatabaseImpl tempDatabaseImpl;

  AuthServiceImp(
      {required this.serviceHelpersImp, required this.tempDatabaseImpl});

  @override
  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var body = {'email': email, 'password': password};

    Response response = await serviceHelpersImp.postWithoutToken(
        endPointUrl: '/api/v1/auth/login', body: body, context: context);

    globalPop(context: context);

    if (response.statusCode == 401) {
      globalToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 200) {
      globalToast('Login successful');
      tempDatabaseImpl.saveUserData(userData: response.body);
      globalReplaceWith(route: Routes.dashboard);
    }
  }

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required BuildContext context}) async {
    var body = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password
    };

    Response response = await serviceHelpersImp.postWithoutToken(
        endPointUrl: '/api/v1/auth/signup', body: body, context: context);

    globalPop(context: context);

    if (response.statusCode == 400) {
      globalToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 200) {
      globalToast('Registration successful');
      tempDatabaseImpl.saveUserData(userData: response.body);
      globalReplaceWith(route: Routes.dashboard);
    }
  }
}
