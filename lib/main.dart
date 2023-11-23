import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/data/network/bloc_observer/bloc_observer.dart';
import 'app/data/network/shared_preferences/cash_helper.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //stop mopile rotation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await ChashHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
