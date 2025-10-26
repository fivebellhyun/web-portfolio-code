import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/components/app_images.dart';
import 'package:taoss3932_web_site/app_bootstrapper.dart';
import 'package:taoss3932_web_site/screen/welcome_page.dart';
import 'package:taoss3932_web_site/helper/constants/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootstrapper.init(runApp: runApp);
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    precacheImage(const CachedNetworkImageProvider(AppImages.clubsandwich), context);
    precacheImage(const CachedNetworkImageProvider(AppImages.dreamFilmIcon), context);
    precacheImage(const CachedNetworkImageProvider(AppImages.myDownload), context);
    precacheImage(const CachedNetworkImageProvider(AppImages.globalChallenge), context);
    precacheImage(const CachedNetworkImageProvider(AppImages.profile), context);
    precacheImage(const CachedNetworkImageProvider(AppImages.blisEdu), context);

    return MaterialApp(
      color: Colors.black,
      title: '오종현 | five bell hyun',
      theme: AppTheme.light(),
      darkTheme: AppTheme.light(),
      home: const WelcomePage(),
    );
  }
}