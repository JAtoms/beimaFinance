import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dependency/get_it.dart';
import 'ui_screens/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const Index());
  });
}
