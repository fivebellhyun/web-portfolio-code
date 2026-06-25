import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taoss3932_web_site/main.dart';

import 'package:web/web.dart' as web;

class AppBootstrapper {
  const AppBootstrapper._();

  static Future<void> init({
    required void Function(Widget) runApp,
  }) async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final loadingScreen = web.document.querySelector('.loading-screen') as web.HTMLElement?;
    if (loadingScreen != null) {
      loadingScreen.style.display = 'none';
    }

    runApp(const MyApp());
  }
}