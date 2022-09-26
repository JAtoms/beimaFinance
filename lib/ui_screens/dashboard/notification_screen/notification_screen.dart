
import 'package:flutter/material.dart';

import '../../../helpers/global_assets.dart';
import '../../components/check_main_screen/check_mail_screen.dart';
import '../../components/global_back_button.dart';
import '../../components/state_screen/state_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(GlobalAssets.backdrop),
          StateScreen(
              stateParameters: StateParameters(
                  title: 'Your have no notification',
                  image: GlobalAssets.noNotification,
                  subTitle: 'Notifications appear here as soon as they are available.',
                  btnText: '',
                  isBtnVisible: false,
                  onTap: () {})),
          const GlobalBackButton(),
        ],
      ),
    );
  }
}
