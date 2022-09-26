import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../helpers/helpers.dart';

abstract class ServiceHelpers {
  Future<Response> postWithoutToken(
      {required String endPointUrl,
      required Map<String, dynamic> body,
      required BuildContext context});

  Future<Response> postWithToken(
      {required String endPointUrl,
      required Map<String, dynamic> body,
      required String token});

  Future<Response> getWithToken(
      {required String endPointUrl, required String token});

  Future<Response> getWithQuery(
      {required String endPointUrl,
      required String token,
      required Map<String, dynamic> query});
}

class ServiceHelpersImp extends ServiceHelpers {
  final http.Client httpClient;

  var headerUrl = 'bim-api-production.up.railway.app';
  late Response response;

  ServiceHelpersImp(this.httpClient);

  @override
  Future<Response> postWithoutToken(
      {required String endPointUrl,
      required Map<String, dynamic> body,
      required BuildContext context}) async {
    try {
      final uri = Uri.https(headerUrl, endPointUrl);
      response = await httpClient.post(uri, body: jsonEncode(body), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        var errorMessage = 'The connection timed out, please try again';
        globalToast(errorMessage);
        globalPop(context: context);
        throw TimeoutException(errorMessage);
      });
      return response;
    } catch (_) {
      globalExceptionPrint(_.toString());
      return response;
    }
  }

  @override
  Future<Response> postWithToken(
      {required String endPointUrl,
      required Map<String, dynamic> body,
      required String token}) async {
    try {
      final uri = Uri.https(headerUrl, endPointUrl);

      response = await httpClient.post(uri, body: jsonEncode(body), headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      }).timeout(const Duration(seconds: 15), onTimeout: () {
        var errorMessage = 'The connection timed out, please try again';
        globalToast(errorMessage);
        throw TimeoutException(errorMessage);
      });
      return response;
    } catch (_) {
      globalExceptionPrint(_.toString());
      return response;
    }
  }

  @override
  Future<Response> getWithToken(
      {required String endPointUrl, required String token}) async {
    try {
      final uri = Uri.https(headerUrl, endPointUrl);
      response = await httpClient.get(uri, headers: {
        'x-auth-token': token,
      }).timeout(const Duration(seconds: 15), onTimeout: () {
        var errorMessage = 'The connection timed out, please try again';
        globalToast(errorMessage);
        throw TimeoutException(errorMessage);
      });
      return response;
    } catch (_) {
      globalExceptionPrint(_.toString());
      return response;
    }
  }

  @override
  Future<Response> getWithQuery(
      {required String endPointUrl,
      required String token,
      required Map<String, dynamic> query}) async {
    try {
      final uri = Uri.https(headerUrl, endPointUrl, query);
      response = await httpClient.get(uri, headers: {
        'x-auth-token': token,
      }).timeout(const Duration(seconds: 15), onTimeout: () {
        var errorMessage = 'The connection timed out, please try again';
        globalToast(errorMessage);
        throw TimeoutException(errorMessage);
      });
      return response;
    } catch (_) {
      globalExceptionPrint(_.toString());
      return response;
    }
  }
}
