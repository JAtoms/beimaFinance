
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../api_service/auth/auth_api.dart';
import '../../../api_service/transaction_api/transaction_api.dart';
import '../../../database/plan_model.dart';
import '../../../database/profile_model.dart';
import '../../../database/shared_preferences.dart';
import '../../../helpers/helpers.dart';

class DashBoardState {
  ProfileModel? profileModel;
  List<Plans> plans;
  bool isLoading;
  double conversionRate;

  DashBoardState(
      {required this.profileModel,
      required this.isLoading,
      required this.conversionRate,
      required this.plans});
}

class DashBoardCubit extends Cubit<DashBoardState> {
  AuthServiceImp authServiceImp;
  TempDatabaseImpl tempDatabaseImpl;
  TransactionImp transactionImp;

  DashBoardCubit(
      {required this.authServiceImp,
      required this.tempDatabaseImpl,
      required this.transactionImp})
      : super(DashBoardState(
            profileModel: null,
            isLoading: false,
            conversionRate: 0.0,
            plans: []));

  void emitState() {
    emit(DashBoardState(
        profileModel: state.profileModel,
        isLoading: state.isLoading,
        conversionRate: state.conversionRate,
        plans: state.plans));
  }

  void setLoading(bool isLoading) {
    emit(DashBoardState(
        profileModel: state.profileModel,
        conversionRate: state.conversionRate,
        isLoading: isLoading,
        plans: state.plans));
  }

  void fetchUserData() {
    var _tempData = tempDatabaseImpl.getUserData();
    if (_tempData.isNotEmpty) {
      state.profileModel = profileModelFromJson(_tempData);
      emitState();
    }
  }

  void fetchConversionRate() async {
    state.conversionRate = await transactionImp.getConversionRate(
        token: state.profileModel!.data.authToken);
    emitState();
  }

  void createFlexiblePlan(
      {required BuildContext context,
      required String amount,
      required int date}) async {
    showLoaderDialog(context);
    transactionImp.createFlexiblePlan(
        context: context,
        token: state.profileModel!.data.authToken,
        amount: amount,
        date: date);
  }

  void getPlans() async {
    setLoading(true);
    var plans = await transactionImp.getPlans(
        token: state.profileModel!.data.authToken);

    state.plans.removeWhere((e) => plans.any((element) => e.id == element.id));
    state.plans = [...plans, ...state.plans];

    setLoading(false);
  }
}
