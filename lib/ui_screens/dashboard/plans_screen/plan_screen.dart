
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../database/plan_model.dart';
import '../../../dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import '../../../dependency/navigation/global_routes.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/shimmer.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/check_main_screen/check_mail_screen.dart';
import '../../components/state_screen/state_screen.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  @override
  void initState() {
    context.read<DashBoardCubit>().getPlans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
        builder: (context, state) {
      return Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.heightAdjusted(5),
                    top: SizeConfig.heightAdjusted(15)),
                child: Text('Your Plans',
                    style: GlobalTextStyles.title(
                        fontSize: 28, color: Colors.white)),
              ),
              state.isLoading
                  ? const GlobalShimmerLoader()
                  : !state.isLoading && state.plans.isNotEmpty
                      ? ListOfPlanWidget(dashboardState: state)
                      : Expanded(
                          child: StateScreen(
                              stateParameters: StateParameters(
                                  title: 'Your have no subscribed plan',
                                  image: GlobalAssets.noPlan,
                                  subTitle:
                                      'Subscribe to a pension plan today for a better tomorrow.',
                                  btnText: 'Find a Plan',
                                  isBtnVisible: true,
                                  onTap: () {})),
                        ),
            ],
          ),
        ],
      );
    });
  }
}

class ListOfPlanWidget extends StatelessWidget {
  const ListOfPlanWidget({Key? key, required this.dashboardState})
      : super(key: key);

  final DashBoardState dashboardState;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: dashboardState.plans.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => globalNavigateTo(
                    route: Routes.planDetailScreen,
                    arguments: dashboardState.plans[index]),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.heightAdjusted(3),
                      left: SizeConfig.heightAdjusted(3),
                      right: SizeConfig.heightAdjusted(3)),
                  decoration: BoxDecoration(
                      color: GlobalColors.inputField,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ImageIcon(plan: dashboardState.plans[index]),
                      SizedBox(width: SizeConfig.heightAdjusted(5)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                formatFigures(dashboardState
                                    .plans[index].amountSaved
                                    .toDouble()),
                                style: GlobalTextStyles.title(
                                    color: Colors.white, fontSize: 35)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PlanTypeWidget(
                                    plan: dashboardState.plans[index]),
                                Text(
                                    '${dashboardState.plans[index].amountSaved.toString()}%',
                                    style: GlobalTextStyles.regularText(
                                        color: Colors.yellow.withAlpha(150),
                                        fontSize: 14))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}

class PlanTypeWidget extends StatelessWidget {
  const PlanTypeWidget({Key? key, required this.plan}) : super(key: key);

  final Plans plan;

  @override
  Widget build(BuildContext context) {
    return Text(
        plan.name == PlanType.flexible.name
            ? 'Flexible plan'
            : plan.name == PlanType.retirement.name
                ? 'Retirement plan'
                : plan.name == PlanType.threeyrs.name
                    ? 'Three years plan'
                    : plan.name == PlanType.tenyrs.name
                        ? 'Ten years plan'
                        : '',
        style: GlobalTextStyles.regularText(
            color: Colors.white.withAlpha(160), fontSize: 14));
  }
}

class ImageIcon extends StatelessWidget {
  const ImageIcon({Key? key, required this.plan}) : super(key: key);

  final Plans plan;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        plan.name == PlanType.flexible.name
            ? GlobalAssets.flexible
            : plan.name == PlanType.retirement.name
                ? GlobalAssets.retirement
                : plan.name == PlanType.threeyrs.name
                    ? GlobalAssets.threeyrs
                    : plan.name == PlanType.tenyrs.name
                        ? GlobalAssets.tenyrs
                        : '',
        height: SizeConfig.heightAdjusted(8));
  }
}
