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

    runApp(const MyApp());
    //앱 로드 후 html 로딩 화면 지우기
    WidgetsBinding.instance.addPostFrameCallback((_) => _markReady());
  }

  static void _markReady() {
    final body = web.document.body;
    if (body == null) return;
    if (body.className.contains('flutter-ready')) return;
    body.className = '${body.className} flutter-ready'.trim();
  }
}