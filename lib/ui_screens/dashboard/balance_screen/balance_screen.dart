
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../database/balance_model.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/global_back_button.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          Column(
            children: [
              const GlobalBackButton(
                  titleText: 'Balances', isTitleVisible: true),
              Flexible(
                child: ListView.builder(
                    itemCount: BalanceModel.balances.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(
                                bottom: SizeConfig.heightAdjusted(3),
                                left: SizeConfig.heightAdjusted(3),
                                right: SizeConfig.heightAdjusted(3)),
                            decoration: BoxDecoration(
                                color:
                                    BalanceModel.balances[index].balanceType ==
                                            BalanceType.amountSaved
                                        ? GlobalColors.primary
                                        : BalanceModel.balances[index]
                                                    .balanceType ==
                                                BalanceType.interest
                                            ? GlobalColors.card
                                            : BalanceModel.balances[index]
                                                        .balanceType ==
                                                    BalanceType.reward
                                                ? GlobalColors.inputField
                                                : null,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(100),
                                      borderRadius: BorderRadius.circular(10)),
                                  child:
                                      SvgPicture.asset(GlobalAssets.omegaIcon),
                                ),
                                SizedBox(width: SizeConfig.heightAdjusted(3)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        BalanceModel.balances[index]
                                                    .balanceType ==
                                                BalanceType.reward
                                            ? BalanceModel
                                                .balances[index].amount.toString() + ' BIM'
                                            : formatFigures(BalanceModel
                                                .balances[index].amount),
                                        style: GlobalTextStyles.title(
                                            color: Colors.white, fontSize: 35)),
                                    Text(
                                        BalanceModel.balances[index]
                                                    .balanceType ==
                                                BalanceType.amountSaved
                                            ? 'Amount saved'
                                            : BalanceModel.balances[index]
                                                        .balanceType ==
                                                    BalanceType.interest
                                                ? 'Interest'
                                                : BalanceModel.balances[index]
                                                            .balanceType ==
                                                        BalanceType.reward
                                                    ? formatFigures(0)
                                                    : '',
                                        style: GlobalTextStyles.regularText(
                                            color: Colors.white, fontSize: 14)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
