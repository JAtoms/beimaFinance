
import 'package:flutter/material.dart';

import '../../helpers/size_config.dart';
import '../../helpers/text_styles.dart';

class GlobalBackButton extends StatelessWidget {
  const GlobalBackButton(
      {Key? key, this.titleText = '', this.isTitleVisible = false})
      : super(key: key);

  final String titleText;
  final bool isTitleVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.only(
          top: SizeConfig.heightAdjusted(10),
          left: SizeConfig.heightAdjusted(5),
          right: SizeConfig.heightAdjusted(5)),
      child: Row(
        children: [
          InkWell(
              borderRadius:
                  BorderRadius.circular(SizeConfig.heightAdjusted(90)),
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              )),
          SizedBox(width: SizeConfig.heightAdjusted(3)),
          if (isTitleVisible)
            Expanded(
              child: Text(titleText,
                  style:
                      GlobalTextStyles.title(fontSize: 28, color: Colors.white)),
            )
        ],
      ),
    );
  }
}
