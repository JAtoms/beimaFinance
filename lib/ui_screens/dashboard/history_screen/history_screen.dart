
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../database/history_model.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/global_back_button.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Image.asset(GlobalAssets.backdrop),
        Column(
          children: [
            const GlobalBackButton(titleText: 'History', isTitleVisible: true),
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: HistoryModel.history.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => HistoryWidget(
                        historyModel: HistoryModel.history[index])),
              ),
            )
          ],
        )
      ],
    );

    // StateScreen(
    //   stateParameters: StateParameters(
    //       title: 'No history yet',
    //       image: GlobalAssets.noHistory,
    //       subTitle: 'History will  appear here as soon as there is one.',
    //       btnText: '',
    //       isBtnVisible: false,
    //       onTap: () {}));
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key, required this.historyModel}) : super(key: key);

  final HistoryModel historyModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: SizeConfig.heightAdjusted(4),
          right: SizeConfig.heightAdjusted(5),
          left: SizeConfig.heightAdjusted(5)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
            color: GlobalColors.inputField.withAlpha(190),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white.withAlpha(100),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(GlobalAssets.deposit,
                  height: SizeConfig.heightAdjusted(2.5)),
            ),
            SizedBox(width: SizeConfig.heightAdjusted(3)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          HistoryType.deposit == historyModel.historyType
                              ? 'Deposit'
                              : HistoryType.withdrawal ==
                                      historyModel.historyType
                                  ? 'Deposit'
                                  : HistoryType.interest ==
                                          historyModel.historyType
                                      ? 'Interest'
                                      : '',
                          style: GlobalTextStyles.title(
                              color: Colors.white.withAlpha(180),
                              fontSize: 16)),
                      Text(historyModel.date,
                          style: GlobalTextStyles.regularText(
                              color: Colors.white.withAlpha(180), fontSize: 12))
                    ],
                  ),
                  Text(formatFigures(historyModel.amount),
                      style: GlobalTextStyles.regularText(
                          color: HistoryType.deposit == historyModel.historyType
                              ? Colors.yellow
                              : HistoryType.withdrawal ==
                                      historyModel.historyType
                                  ? Colors.red
                                  : HistoryType.interest ==
                                          historyModel.historyType
                                      ? Colors.green
                                      : Colors.transparent,
                          fontSize: 12))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
