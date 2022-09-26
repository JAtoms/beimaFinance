import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/colors.dart';
import '../../../helpers/global_assets.dart';
import '../../../helpers/text_styles.dart';
import '../../helpers/size_config.dart';

final pagePosition = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 13,
              blurRadius: 7,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.heightAdjusted(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            BottomNavItem(itemName: 'Home', index: 0, icon: GlobalAssets.home),
            BottomNavItem(itemName: 'Plans', index: 1, icon: GlobalAssets.plan),
            BottomNavItem(
                itemName: 'History', index: 2, icon: GlobalAssets.history),
            BottomNavItem(
                itemName: 'Profile', index: 3, icon: GlobalAssets.profile)
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatefulWidget {
  final String icon, itemName;
  final int index;

  const BottomNavItem(
      {Key? key,
      required this.icon,
      required this.itemName,
      required this.index})
      : super(key: key);

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pagePosition,
        builder: (context, value, child) {
          return GestureDetector(
            onTap: () => pagePosition.value = widget.index,
            child: Container(
              height: Platform.isIOS
                  ? SizeConfig.heightAdjusted(12)
                  : SizeConfig.heightAdjusted(15),
              width: MediaQuery.of(context).size.width / 4,
              color: Colors.transparent,
              child: Column(
                children: [
                  SvgPicture.asset(widget.icon,
                      color: value == widget.index
                          ? GlobalColors.primary
                          : GlobalColors.ashWhite.withAlpha(50),
                      height: SizeConfig.heightAdjusted(5)),
                  SizedBox(height: SizeConfig.heightAdjusted(3)),
                  Text(
                    widget.itemName,
                    style: GlobalTextStyles.regularText(
                        fontSize: 13,
                        color: value == widget.index
                            ? GlobalColors.primary
                            : GlobalColors.ashWhite.withAlpha(50)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
