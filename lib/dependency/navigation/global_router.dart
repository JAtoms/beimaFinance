
import 'package:page_transition/page_transition.dart';

import '../../database/plan_model.dart';
import '../../ui_screens/auth_screens/forgot_password_screen/forgot_password_screen.dart';
import '../../ui_screens/auth_screens/login_screen/login_screen.dart';
import '../../ui_screens/auth_screens/overview_screen/overview_screen.dart';
import '../../ui_screens/auth_screens/signup_screen/signup_screen.dart';
import '../../ui_screens/components/check_main_screen/check_mail_screen.dart';
import '../../ui_screens/dashboard/balance_screen/balance_screen.dart';
import '../../ui_screens/dashboard/dashboard.dart';
import '../../ui_screens/dashboard/notification_screen/notification_screen.dart';
import '../../ui_screens/dashboard/plans_screen/choose_card_screen.dart';
import '../../ui_screens/dashboard/plans_screen/create_plan_screen.dart';
import '../../ui_screens/dashboard/plans_screen/plan_detail_screen.dart';
import 'global_routes.dart';

class GlobalRouter {
  GlobalRouter._();

  static generateRoutes(settings) {
    switch (settings.name) {
      // Auth and on boarding
      case Routes.overviewScreen:
        return PageTransition(
            child: const OverviewScreen(),
            type: PageTransitionType.bottomToTop,
            settings: settings);

      case Routes.loginScreen:
        return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.leftToRight,
            settings: settings);

      case Routes.signUpScreen:
        return PageTransition(
            child: const SignUpScreen(),
            type: PageTransitionType.rightToLeft,
            settings: settings);

      case Routes.forgotPasswordScreen:
        return PageTransition(
            child: const ForgotPasswordScreen(),
            type: PageTransitionType.rightToLeft,
            settings: settings);

      case Routes.checkMailScreen:
        return PageTransition(
            child: CheckMailScreen(
                stateParameters: settings.arguments as StateParameters),
            type: PageTransitionType.leftToRightWithFade,
            settings: settings);

      case Routes.dashboard:
        return PageTransition(
            child: const Dashboard(),
            type: PageTransitionType.rightToLeft,
            settings: settings);

      case Routes.notificationScreen:
        return PageTransition(
            child: const NotificationScreen(),
            type: PageTransitionType.rightToLeft,
            settings: settings);

      case Routes.balanceScreen:
        return PageTransition(
            child: const BalanceScreen(),
            type: PageTransitionType.rightToLeft,
            settings: settings);

      case Routes.planDetailScreen:
        return PageTransition(
            child: PlanDetailScreen(plans: settings.arguments as Plans),
            type: PageTransitionType.rightToLeft,
            settings: settings);

      case Routes.createPlanScreen:
        return PageTransition(
            child: CreatePlanScreen(planType: settings.arguments as PlanType),
            type: PageTransitionType.rightToLeft,
            settings: settings);

      case Routes.chooseCardScreen:
        return PageTransition(
            child: const ChooseCardScreen(),
            type: PageTransitionType.rightToLeft,
            settings: settings);
    }
  }
}
