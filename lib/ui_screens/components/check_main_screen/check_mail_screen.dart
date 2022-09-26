
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/global_assets.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../global_button_medium.dart';

class CheckMailScreen extends StatelessWidget {
  const CheckMailScreen({Key? key, required this.stateParameters})
      : super(key: key);

  final StateParameters stateParameters;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.asset(GlobalAssets.backdrop),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(stateParameters.image, height: SizeConfig.heightAdjusted(30)),
                  SizedBox(height: SizeConfig.heightAdjusted(5)),
                  Text(stateParameters.title,
                      style: GlobalTextStyles.title(
                          color: Colors.white, fontSize: 28)),
                  SizedBox(height: SizeConfig.heightAdjusted(2)),
                  Text(stateParameters.subTitle,
                      style: GlobalTextStyles.regularText(
                          color: Colors.white.withAlpha(170), fontSize: 15)),
                  SizedBox(height: SizeConfig.heightAdjusted(15)),
                  stateParameters.isBtnVisible
                      ? GlobalButtonMedium(
                          btnText: stateParameters.btnText,
                          onTap: stateParameters.onTap)
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StateParameters {
  String title;
  String subTitle;
  String btnText;
  String image;
  bool isBtnVisible;
  Function() onTap;

  StateParameters(
      {required this.title,
      required this.image,
      required this.subTitle,
      required this.btnText,
      required this.isBtnVisible,
      required this.onTap});
}
