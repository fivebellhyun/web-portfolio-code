import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taoss3932_web_site/main.dart';

import 'dart:html';

class AppBootstrapper {
  const AppBootstrapper._();

  static Future<void> init({
    required void Function(Widget) runApp,
  }) async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    querySelector("#loading-screen")?.style.display = 'none';

    runApp(const MyApp());
  }
}