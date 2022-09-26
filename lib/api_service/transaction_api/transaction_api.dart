import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../database/plan_model.dart';
import '../../helpers/helpers.dart';
import '../payments/paystack/paystack_payment.dart';
import '../service.dart';

abstract class TransactionService {
  Future<void> createFlexiblePlan(
      {required BuildContext context,
      required String amount,
      required String token,
      required int date});

  Future<void> createThreeYearPlan(
      {required BuildContext context,
      required String amount,
      required String date});

  Future<void> createTenYearPlan(
      {required BuildContext context,
      required String amount,
      required String date});

  Future<List<Plans>> getPlans({required token});

  Future<double> getConversionRate({required token});
}

class TransactionImp extends TransactionService {
  ServiceHelpersImp serviceHelpersImp;

  TransactionImp({required this.serviceHelpersImp});

  @override
  Future<void> createFlexiblePlan(
      {required BuildContext context,
      required String amount,
      required String token,
      required int date}) async {
    {
      var body = {
        'name': 'flexible',
        'dueDate': (DateTime.now().add(Duration(days: 30 * date))).toString(),
        'nativeCurrency': 'NGN',
        'savingsPerMonth': amount
      };

      Response response = await serviceHelpersImp.postWithToken(
          endPointUrl: '/api/v1/plans', body: body, token: token);

      globalPop(context: context);

      if (response.statusCode == 400) {
        globalToast(jsonDecode(response.body)['message']);
      } else if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        PaystackPayment().chargeCardAndMakePayment(
            context: context,
            price: body['data']['nativeAmount'],
            email: 'user@gmail.com',
            accessCode: body['data']['transaction_id']);
      }
    }
  }

  @override
  Future<void> createTenYearPlan(
      {required BuildContext context,
      required String amount,
      required String date}) async {
    // TODO: implement createTenYearPlan
    throw UnimplementedError();
  }

  @override
  Future<void> createThreeYearPlan(
      {required BuildContext context,
      required String amount,
      required String date}) async {
    // TODO: implement createThreeYearPlan
    throw UnimplementedError();
  }

  @override
  Future<List<Plans>> getPlans({required token}) async {
    List<Plans> plans = [];
    Response response = await serviceHelpersImp.getWithToken(
        endPointUrl: '/api/v1/plans/me', token: token);

    if (response.statusCode == 200) {
      plans = planModelFromJson(response.body).data;
    } else {}
    return plans;
  }

  @override
  Future<double> getConversionRate({required token}) async {
    double conversionRate = 00;
    Response response = await serviceHelpersImp.getWithQuery(
        query: {'currencyTo': 'NGN'},
        endPointUrl: '/api/v1/currency-rates',
        token: token);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      conversionRate = body['data']['rate'].toDouble();
    } else {}
    return conversionRate;
  }
}
