
import 'package:flutter/material.dart';

import '../../helpers/colors.dart';
import '../../helpers/size_config.dart';
import '../../helpers/text_styles.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {Key? key,
      required this.btnText,
      this.isOutlined = false,
      this.isGray = false,
      required this.onTap})
      : super(key: key);

  final String btnText;
  final bool isOutlined;
  final Function() onTap;
  final bool isGray;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: SizeConfig.heightAdjusted(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isOutlined
                ? Colors.white
                : isGray
                    ? Colors.black12
                    : GlobalColors.primary,
            border: Border.all(
                color: isOutlined ? GlobalColors.primary : Colors.transparent),
            borderRadius: BorderRadius.circular(SizeConfig.heightAdjusted(3))),
        child: Text(btnText,
            style: GlobalTextStyles.medium(
                context: context,
                color: isOutlined ? Colors.black : Colors.white)),
      ),
    );
  }
}
