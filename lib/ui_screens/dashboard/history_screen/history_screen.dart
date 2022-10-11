import 'package:beima/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:beima/ui_screens/components/check_main_screen/check_mail_screen.dart';
import 'package:beima/ui_screens/components/state_screen/state_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../database/history_model.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    context.read<DashBoardCubit>().getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
        builder: (context, state) {
      return Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          state.historyList.isEmpty
              ? StateScreen(
                  stateParameters: StateParameters(
                      title: 'No history yet',
                      image: GlobalAssets.noHistory,
                      subTitle:
                          'History will  appear here as soon as there is one.',
                      btnText: '',
                      isBtnVisible: false,
                      onTap: () {}))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.heightAdjusted(5),
                          top: SizeConfig.heightAdjusted(15)),
                      child: Text('History',
                          style: GlobalTextStyles.title(
                              fontSize: 28, color: Colors.white)),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.historyList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => HistoryWidget(
                                history: state.historyList[index])),
                      ),
                    )
                  ],
                )
        ],
      );
    });
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key, required this.history}) : super(key: key);

  final History history;

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
                          HistoryType.deposit.name == history.type
                              ? 'Deposit'
                              : HistoryType.withdrawal.name == history.type
                                  ? 'Deposit'
                                  : HistoryType.interest.name == history.type
                                      ? 'Interest'
                                      : '',
                          style: GlobalTextStyles.title(
                              color: Colors.white.withAlpha(180),
                              fontSize: 16)),
                      Text(history.createdAt,
                          style: GlobalTextStyles.regularText(
                              color: Colors.white.withAlpha(180), fontSize: 12))
                    ],
                  ),
                  Text(formatFigures(history.amount.valueInUsd.toDouble()),
                      style: GlobalTextStyles.regularText(
                          color: HistoryType.deposit.name == history.type
                              ? Colors.yellow
                              : HistoryType.withdrawal.name == history.type
                                  ? Colors.red
                                  : HistoryType.interest.name == history.type
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
