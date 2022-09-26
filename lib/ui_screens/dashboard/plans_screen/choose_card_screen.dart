
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/global_back_button.dart';

class ChooseCardScreen extends StatelessWidget {
  const ChooseCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalBackButton(
                  titleText: 'Make Payment', isTitleVisible: true),
              SizedBox(height: SizeConfig.heightAdjusted(1)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.heightAdjusted(5)),
                child: Text('Choose a card to be used for the plan',
                    style: GlobalTextStyles.regularText(
                        color: Colors.white.withAlpha(150), fontSize: 14)),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.heightAdjusted(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        margin:
                            EdgeInsets.only(top: SizeConfig.heightAdjusted(10)),
                        decoration: BoxDecoration(
                          color: GlobalColors.inputField.withAlpha(150),
                            border: Border.all(color: GlobalColors.inputField),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            SvgPicture.asset(GlobalAssets.masterLogo),
                            SizedBox(width: SizeConfig.heightAdjusted(6)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('xxxx   xxxx   xxxx   xxxx ', style: GlobalTextStyles.regularText(color: Colors.white)),
                                  Text('5679', style: GlobalTextStyles.regularText(color: Colors.white)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(10)),
                      Divider(height: 2, color: Colors.white.withAlpha(100)),
                      GestureDetector(
                        onTap: () => globalToast('Coming soon!'),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          margin:
                          EdgeInsets.only(top: SizeConfig.heightAdjusted(10)),
                          decoration: BoxDecoration(
                              color: GlobalColors.inputField,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              SvgPicture.asset(GlobalAssets.cardLogo),
                              SizedBox(width: SizeConfig.heightAdjusted(6)),
                              Text('Add new card', style: GlobalTextStyles.regularText(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
