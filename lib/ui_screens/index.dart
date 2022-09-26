
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../database/shared_preferences.dart';
import '../dependency/cubit/auth_cubit/auth_cubit.dart';
import '../dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import '../dependency/get_it.dart';
import '../dependency/navigation/global_router.dart';
import '../dependency/navigation/global_routes.dart';
import '../dependency/navigation/navigation_service.dart';
import '../helpers/colors.dart';
import '../helpers/size_config.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late AuthCubit _authCubit;
  late DashBoardCubit _dashBoardCubit;

  @override
  void initState() {
    _authCubit = getItInstance<AuthCubit>();
    _dashBoardCubit = getItInstance<DashBoardCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _authCubit.close();
    super.dispose();
  }

  String initialRoute() {
    var route = getItInstance<TempDatabaseImpl>().getUserData().isEmpty
        ? Routes.overviewScreen
        : Routes.dashboard;
    return route;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _authCubit),
                BlocProvider.value(value: _dashBoardCubit)
              ],
              child: MaterialApp(
                title: 'Beima',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: GlobalColors.materialPrimaryColor,
                ),
                navigatorKey:
                    getItInstance<NavigationServiceImpl>().navigationKey,
                initialRoute: initialRoute(),
                onGenerateRoute: (value) => GlobalRouter.generateRoutes(value),
              ),
            );
          });
        }));
  }
}
