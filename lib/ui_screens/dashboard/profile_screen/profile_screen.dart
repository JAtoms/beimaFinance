import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/helpers.dart';
import '../../../helpers/size_config.dart';
import '../../../helpers/text_styles.dart';
import '../../components/global_back_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardCubit, DashBoardState>(
        builder: (context, eventState) {
      return Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      top: SizeConfig.heightAdjusted(15),
                      left: SizeConfig.heightAdjusted(5),
                      right: SizeConfig.heightAdjusted(5)),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.heightAdjusted(10),
                      vertical: SizeConfig.heightAdjusted(10)),
                  decoration: BoxDecoration(
                      color: GlobalColors.inputField.withAlpha(170),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    SvgPicture.asset(GlobalAssets.avartar),
                    SizedBox(height: SizeConfig.heightAdjusted(5)),
                    Text(
                        '${eventState.profileModel!.data.user.firstName} ${eventState.profileModel!.data.user.lastName}',
                        style: GlobalTextStyles.title(
                            color: Colors.white, fontSize: 20)),
                    // Container(
                    //   margin:
                    //       EdgeInsets.only(top: SizeConfig.heightAdjusted(5)),
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: SizeConfig.heightAdjusted(2),
                    //       vertical: SizeConfig.heightAdjusted(2)),
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: GlobalColors.primary),
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Text('Edit Profile',
                    //       style: GlobalTextStyles.regularText(
                    //           color: Colors.white60)),
                    // )
                  ]),
                ),
                ProfileWidget(
                    image: GlobalAssets.bank,
                    title: 'Bank Details',
                    onTap: () {}),
                ProfileWidget(
                    image: GlobalAssets.card,
                    title: 'Card Details',
                    onTap: () {}),
                ProfileWidget(
                    image: GlobalAssets.wallet,
                    title: 'Connect Wallet',
                    onTap: () {}),
                ProfileWidget(
                    image: GlobalAssets.security, title: 'Security', onTap: () {}),
                ProfileWidget(
                    image: GlobalAssets.support, title: 'Support', onTap: () {}),
                SizedBox(height: SizeConfig.heightAdjusted(5)),
              ],
            ),
          )
        ],
      );
    });
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {Key? key, required this.image, required this.title, required this.onTap})
      : super(key: key);

  final String image, title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            top: SizeConfig.heightAdjusted(5),
            left: SizeConfig.heightAdjusted(5),
            right: SizeConfig.heightAdjusted(5)),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightAdjusted(4),
            vertical: SizeConfig.heightAdjusted(4)),
        decoration: BoxDecoration(
            color: GlobalColors.inputField.withAlpha(190),
            border: Border.all(color: GlobalColors.primary.withAlpha(100)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(width: SizeConfig.heightAdjusted(5)),
            Text(title,
                style: GlobalTextStyles.regularText(color: Colors.white60)),
          ],
        ),
      ),
    );
  }
}
