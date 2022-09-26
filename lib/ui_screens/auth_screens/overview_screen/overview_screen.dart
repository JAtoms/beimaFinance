
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../dependency/navigation/global_routes.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/global_strings.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.heightAdjusted(5),
              right: SizeConfig.heightAdjusted(5),
              top: SizeConfig.heightAdjusted(20),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeIn(
                        child: rainbowText(
                            title: 'A Retirement Solution You Can ',
                            subTitle: 'Trust.'),
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeIn,
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(5)),
                      Text(retirementExplanation,
                          style: GlobalTextStyles.regularText(
                              color: Colors.white.withAlpha(170), fontSize: 15))
                    ],
                  ),
                ),
                Row(
                  children: [
                    ActionWidget(
                      titleText: login,
                      subtitleText: continueToPlan,
                      image: GlobalAssets.smilingFace,
                      onTap: () => globalNavigateTo(route: Routes.loginScreen),
                    ),
                    SizedBox(width: SizeConfig.widthAdjusted(2)),
                    ActionWidget(
                      titleText: signUp,
                      subtitleText: setUpPension,
                      image: GlobalAssets.addPerson,
                      isOutline: true,
                      onTap: () => globalNavigateTo(route: Routes.signUpScreen),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightAdjusted(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    required this.image,
    required this.onTap,
    this.isOutline = false,
  }) : super(key: key);

  final String titleText, subtitleText, image;
  final Function() onTap;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          height: SizeConfig.heightAdjusted(50),
          decoration: BoxDecoration(
              color: isOutline ? null : GlobalColors.primary,
              border: Border.all(
                color: isOutline ? GlobalColors.primary : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(100),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(image),
              ),
              SizedBox(height: SizeConfig.heightAdjusted(15)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText,
                      style: GlobalTextStyles.title(
                          color: Colors.white, fontSize: 30)),
                  Text(subtitleText,
                      style: GlobalTextStyles.regularText(
                          color: Colors.white, fontSize: 14)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
