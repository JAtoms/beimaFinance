import 'package:shared_preferences/shared_preferences.dart';

abstract class TempDatabaseService {
  Future<void> saveUserData({required String userData});

  String getUserData();

  void clearUserData();
}

class TempDatabaseImpl extends TempDatabaseService {
  SharedPreferences prefs;

  TempDatabaseImpl({required this.prefs});

  @override
  void clearUserData() async {
    await prefs.remove('USER_DATA');
  }

  @override
  String getUserData() {
    return prefs.getString('USER_DATA') ?? '';
  }

  @override
  Future<void> saveUserData({required String userData}) async {
    await prefs.setString('USER_DATA', userData);
  }
}
