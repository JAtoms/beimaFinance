
import 'package:beima/dependency/get_it.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../dependency/navigation/navigation_service.dart';
import 'size_config.dart';
import 'text_styles.dart';

void globalNavigateTo({required String route, dynamic arguments}) =>
    getItInstance<NavigationServiceImpl>()
        .navigateTo(route, arguments: arguments);

String formatFigures(double amount) {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  return '${myFormat.simpleCurrencySymbol('USD')} '
      '${myFormat.format(amount)}';
}
String formatFiguresNgn(double amount) {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  return '${myFormat.simpleCurrencySymbol('NGN')} '
      '${myFormat.format(amount)}';
}

String formatFiguresSeparator(double amount) {
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  return myFormat.format(amount);
}

Text rainbowText({
  required String title,
  required String subTitle,
}) {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xff5792EB),
      Color(0xffF24AE1),
      Color(0xffFF3535),
      Color(0xff5792EB)
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
            text: title,
            style: GlobalTextStyles.title(color: Colors.white, fontSize: 60)),
        TextSpan(
            text: subTitle,
            style: GlobalTextStyles.title(
                fontSize: 60, foreground: Paint()..shader = linearGradient)),
      ],
    ),
  );
}

void globalReplaceWith({required String route, dynamic arguments}) =>
    getItInstance<NavigationServiceImpl>()
        .replaceWith(route, arguments: arguments);

void globalReplaceUntil(
        {required context, required route, dynamic arguments}) =>
    getItInstance<NavigationServiceImpl>()
        .replaceUntil(context: context, routeName: route, arguments: arguments);

void globalPop({required BuildContext context}) =>
    getItInstance<NavigationServiceImpl>().pop(context: context);

void showLoaderDialog(BuildContext context) {
  var alert = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.heightAdjusted(5))),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.heightAdjusted(6),
          vertical: SizeConfig.heightAdjusted(6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CupertinoActivityIndicator(),
          SizedBox(width: 10),
          Text('Loading...')
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async => false, child: Container(child: alert));
    },
  );
}

void globalToast(String message) =>
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.white);

void globalPrint(String topic, message) => debugPrint('$dynamic $message');

void globalExceptionPrint(String message) =>
    debugPrint('Finance exception $message');

bool isValidEmail(String email) {
  bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\'
          r's@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
          r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.'
          r')+[a-zA-Z]{2,}))$')
      .hasMatch(email);
  if (emailValid) {
    return true;
  } else {
    return false;
  }
}

bool isValidPassword(String password) {
  var passwordValid =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*]).{8,}$')
          .hasMatch(password);
  if (passwordValid) {
    return true;
  } else if (password.isEmpty) {
    globalToast('Field cannot be empty');
    return false;
  } else {
    return false;
  }
}

CachedNetworkImage buildCachedNetworkImage(
    {required image, required double height, required double width}) {
  return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      width: SizeConfig.heightAdjusted(width),
      height: SizeConfig.heightAdjusted(height));
}

extension FormValidator on GlobalKey<FormState> {
  bool get validate => formValidator(this);
}

bool formValidator(GlobalKey<FormState> globalKey) {
  return globalKey.currentState!.validate();
}
