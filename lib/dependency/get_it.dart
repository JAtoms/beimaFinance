
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../api_service/auth/auth_api.dart';
import '../api_service/service.dart';
import '../api_service/transaction_api/transaction_api.dart';
import '../database/shared_preferences.dart';
import 'cubit/auth_cubit/auth_cubit.dart';
import 'cubit/dashboard_cubit/dashboard_cubit.dart';
import 'navigation/navigation_service.dart';

final getItInstance = GetIt.I;

Future initDependencies() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();

  // Network
  final http.Client _client = http.Client();
  getItInstance.registerLazySingleton<http.Client>(() => _client);

  // Service helpers
  getItInstance
      .registerSingleton<ServiceHelpersImp>(ServiceHelpersImp(getItInstance()));

  //Storage
  getItInstance.registerSingleton<SharedPreferences>(sharedPref);

  getItInstance.registerLazySingleton<TempDatabaseImpl>(
      () => TempDatabaseImpl(prefs: getItInstance()));

  // Navigation service
  getItInstance.registerLazySingleton<NavigationServiceImpl>(
      () => NavigationServiceImpl());

  // AuthServiceImp
  getItInstance.registerSingleton<AuthServiceImp>(AuthServiceImp(
      serviceHelpersImp: getItInstance(), tempDatabaseImpl: getItInstance()));

  // TransactionServiceImp
  getItInstance.registerSingleton<TransactionImp>(
      TransactionImp(serviceHelpersImp: getItInstance()));

  // Auth cubit
  getItInstance
      .registerFactory(() => AuthCubit(authServiceImp: getItInstance()));

  // Dashboard cubit
  getItInstance.registerFactory(() => DashBoardCubit(
      transactionImp: getItInstance(),
      authServiceImp: getItInstance(),
      tempDatabaseImpl: getItInstance()));
}
