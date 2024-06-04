import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:taoss3932_web_site/screen/welcome_page.dart';
import 'package:taoss3932_web_site/theme.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    return RobotDetector(
      child: MaterialApp(
        color: Colors.black,
        title: '오종현 | Jonghyun Oh',
        theme: AppTheme.light(),
        darkTheme: AppTheme.light(),
        home: const WelcomePage(),
        navigatorObservers: [seoRouteObserver],
      ),
    );
  }
}
