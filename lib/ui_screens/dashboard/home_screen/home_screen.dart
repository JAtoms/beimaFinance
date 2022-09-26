
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../database/plan_model.dart';
import '../../../dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import '../../../dependency/navigation/global_routes.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/global_strings.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<DashBoardCubit>().fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
        builder: (context, eventState) {
      return Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.heightAdjusted(5),
                  right: SizeConfig.heightAdjusted(5),
                  top: SizeConfig.heightAdjusted(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: buildCachedNetworkImage(
                              image: 'https://images.unsplash.com/'
                                  'photo-1578758803946-2c4f6738df87?ixlib=rb-'
                                  '1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfH'
                                  'x8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
                              height: 10,
                              width: 10),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FadeIn(
                                    child: Text(
                                        'Hi ${eventState.profileModel!.data.user.firstName}',
                                        style: GlobalTextStyles.title(
                                            fontSize: 30, color: Colors.white)),
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.easeIn,
                                  ),
                                  Text('Good to see you today',
                                      style: GlobalTextStyles.regularText(
                                          fontSize: 16,
                                          color: Colors.white.withAlpha(150)))
                                ],
                              ),
                              InkWell(
                                onTap: () => globalNavigateTo(
                                    route: Routes.notificationScreen),
                                child: Icon(Icons.notifications,
                                    size: 30, color: GlobalColors.primary),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.heightAdjusted(3)),
                    Divider(thickness: 1, color: Colors.white.withAlpha(30))
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthAdjusted(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: SizeConfig.heightAdjusted(5)),
                      GestureDetector(
                        onTap: () =>
                            globalNavigateTo(route: Routes.balanceScreen),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: GlobalColors.primary,
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
                                child: SvgPicture.asset(GlobalAssets.omegaIcon),
                              ),
                              SizedBox(width: SizeConfig.heightAdjusted(3)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(formatFigures(0),
                                      style: GlobalTextStyles.title(
                                          color: Colors.white, fontSize: 35)),
                                  Text('Amount saved',
                                      style: GlobalTextStyles.regularText(
                                          color: Colors.white, fontSize: 14)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(8)),
                      // Text('Activity',
                      //     style: GlobalTextStyles.medium(context: context,
                      //         color: Colors.white.withAlpha(150), fontSize: 18)),
                      // Stack(
                      //   children: [
                      //     SvgPicture.asset(GlobalAssets.activityBanner),
                      //   ],
                      // )
                      Text(beimaPensionPlans,
                          style: GlobalTextStyles.medium(
                              context: context,
                              color: Colors.white.withAlpha(150),
                              fontSize: 18)),
                      SizedBox(height: SizeConfig.heightAdjusted(4)),
                      Row(
                        children: [
                          PensionWidget(
                              planName: 'Flexible Plan',
                              image: GlobalAssets.flexible,
                              onTap: () => globalNavigateTo(
                                  route: Routes.createPlanScreen,
                                  arguments: PlanType.flexible)),
                          SizedBox(width: SizeConfig.heightAdjusted(3)),
                          PensionWidget(
                              planName: 'Retirement Plan',
                              image: GlobalAssets.retirement,
                              onTap: () {})
                        ],
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(3)),
                      Row(
                        children: [
                          PensionWidget(
                              planName: 'Start A 3 Years Plan',
                              image: GlobalAssets.threeyrs,
                              onTap: () {}),
                          SizedBox(width: SizeConfig.heightAdjusted(3)),
                          PensionWidget(
                              planName: 'Start A 10 Years Plan',
                              image: GlobalAssets.tenyrs,
                              onTap: () {})
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}

class PensionWidget extends StatelessWidget {
  const PensionWidget({
    Key? key,
    required this.planName,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  final String planName, image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          height: SizeConfig.heightAdjusted(35),
          decoration: BoxDecoration(
              color: GlobalColors.inputField,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image, height: SizeConfig.heightAdjusted(8)),
              SizedBox(height: SizeConfig.heightAdjusted(8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(planName,
                      style: GlobalTextStyles.title(
                          color: Colors.white.withAlpha(150), fontSize: 18))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
