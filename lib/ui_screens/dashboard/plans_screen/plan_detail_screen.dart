
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../database/history_model.dart';
import '../../../database/plan_model.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/global_back_button.dart';
import '../history_screen/history_screen.dart';

class PlanDetailScreen extends StatefulWidget {
  const PlanDetailScreen({Key? key, required this.plans}) : super(key: key);

  final Plans plans;

  @override
  State<PlanDetailScreen> createState() => _PlanDetailScreenState();
}

class _PlanDetailScreenState extends State<PlanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          Column(
            children: [
              GlobalBackButton(
                  titleText: widget.plans.name == PlanType.flexible.name
                      ? 'Flexible plan'
                      : widget.plans.name == PlanType.retirement.name
                          ? 'Retirement plan'
                          : widget.plans.name == PlanType.threeyrs.name
                              ? 'Three years plan'
                              : widget.plans.name == PlanType.tenyrs.name
                                  ? 'Ten years plan'
                                  : '',
                  isTitleVisible: true),
              SizedBox(height: SizeConfig.heightAdjusted(4)),
              Flexible(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.heightAdjusted(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BalanceWidget(
                                    titleText: formatFigures(
                                        widget.plans.amountSaved.toDouble()),
                                    subtitleText: 'Amount saved'),
                                SizedBox(width: SizeConfig.heightAdjusted(3)),
                                BalanceWidget(
                                    titleText: formatFigures(
                                        widget.plans.amountSaved.toDouble()),
                                    subtitleText: 'Interest accrued',
                                    isOutline: true)
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  top: SizeConfig.heightAdjusted(4)),
                              decoration: BoxDecoration(
                                  color: GlobalColors.inputField,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withAlpha(100),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: SvgPicture.asset(
                                        GlobalAssets.omegaIcon),
                                  ),
                                  SizedBox(width: SizeConfig.heightAdjusted(3)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${formatFiguresSeparator(widget.plans.amountSaved.toDouble())} BIM',
                                          style: GlobalTextStyles.title(
                                              color: Colors.white,
                                              fontSize: 26)),
                                      Text(formatFigures(124500),
                                          style: GlobalTextStyles.regularText(
                                              color: Colors.white,
                                              fontSize: 14)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                TransactionWidget(
                                    color: GlobalColors.inputField,
                                    title: 'Withdraw',
                                    image: GlobalAssets.withdraw,
                                    onTap: () {}),
                                SizedBox(width: SizeConfig.heightAdjusted(4)),
                                TransactionWidget(
                                    color: GlobalColors.primary,
                                    image: GlobalAssets.deposit,
                                    title: 'Deposit',
                                    onTap: () {})
                              ],
                            ),
                            SizedBox(height: SizeConfig.heightAdjusted(5)),
                            Text('History',
                                style: GlobalTextStyles.medium(
                                    context: context,
                                    color: Colors.white.withAlpha(150),
                                    fontSize: 18))
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: HistoryModel.history.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => HistoryWidget(
                              historyModel: HistoryModel.history[index]))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TransactionWidget extends StatelessWidget {
  const TransactionWidget(
      {Key? key,
      required this.color,
      required this.title,
      required this.onTap,
      required this.image})
      : super(key: key);

  final String title, image;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          width: double.infinity,
          margin: EdgeInsets.only(top: SizeConfig.heightAdjusted(4)),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(100),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(image,
                    height: SizeConfig.heightAdjusted(3)),
              ),
              SizedBox(width: SizeConfig.heightAdjusted(3)),
              Text(title,
                  style:
                      GlobalTextStyles.title(color: Colors.white, fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key? key,
    required this.titleText,
    required this.subtitleText,
    this.isOutline = false,
  }) : super(key: key);

  final String titleText, subtitleText;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: isOutline ? Colors.transparent : GlobalColors.primary,
            border: Border.all(
              color:
                  isOutline ? Colors.white.withAlpha(100) : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white.withAlpha(100),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(GlobalAssets.omegaIcon),
            ),
            SizedBox(height: SizeConfig.heightAdjusted(9)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleText,
                    style: GlobalTextStyles.title(
                        color: isOutline
                            ? Colors.white.withAlpha(180)
                            : Colors.white,
                        fontSize: 22)),
                Text(subtitleText,
                    style: GlobalTextStyles.regularText(
                        color: isOutline
                            ? Colors.white.withAlpha(150)
                            : Colors.white,
                        fontSize: 14)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
