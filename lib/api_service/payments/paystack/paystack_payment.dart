import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

import '../../../dependency/navigation/global_routes.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../ui_screens/components/check_main_screen/check_mail_screen.dart';
import 'constant_keys.dart';

class PaystackPayment {
  final PaystackPlugin _paystack = PaystackPlugin();

  //GetUi
  PaymentCard _getCardUI() {
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await _paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
  }

  chargeCardAndMakePayment(
      {required BuildContext context,
      required int price,
      required String email,
      required String accessCode}) async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..accessCode = accessCode
        ..card = _getCardUI();

      try {
        CheckoutResponse response = await _paystack.checkout(
          context,
          charge: charge,
          method: CheckoutMethod.selectable,
          fullscreen: true,
          logo: Image.asset(GlobalAssets.logo,
              height: SizeConfig.heightAdjusted(4)),
        );

        if (response.status == true) {
          globalReplaceWith(
              route: Routes.checkMailScreen,
              arguments: StateParameters(
                  title: 'Your plan was successfully created',
                  subTitle: 'checkMail',
                  image: GlobalAssets.message,
                  btnText: 'Continue',
                  onTap: () => globalReplaceUntil(
                      context: context, route: Routes.dashboard),
                  isBtnVisible: true));
        } else {
          var snackBar = const SnackBar(content: Text('Transaction failed'));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (_) {
        var snackBar = const SnackBar(content: Text('Transaction failed'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
