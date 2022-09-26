
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../check_main_screen/check_mail_screen.dart';
import '../global_button_medium.dart';

class StateScreen extends StatelessWidget {
  const StateScreen({Key? key, required this.stateParameters})
      : super(key: key);

  final StateParameters stateParameters;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(stateParameters.image,
              height: SizeConfig.heightAdjusted(30)),
          SizedBox(height: SizeConfig.heightAdjusted(10)),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.widthAdjusted(4)),
            child: Column(
              children: [
                Text(stateParameters.title,
                    textAlign: TextAlign.center,
                    style: GlobalTextStyles.title(
                        color: Colors.white, fontSize: 24)),
                SizedBox(height: SizeConfig.heightAdjusted(2)),
                Text(stateParameters.subTitle,
                    textAlign: TextAlign.center,
                    style: GlobalTextStyles.regularText(
                        color: Colors.white.withAlpha(170), fontSize: 15)),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightAdjusted(15)),
          stateParameters.isBtnVisible
              ? GlobalButtonMedium(
                  btnText: stateParameters.btnText,
                  onTap: stateParameters.onTap)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
