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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _precached = false;

  /// 첫 프레임이 그려진 뒤에, 실제로 먼저 보게 되는 순서대로 하나씩 캐시로드. 초기 렌더와 경합하지 x
  static const _warmup = <String>[
    AppImages.dreamFilmIcon, // page 0
    AppImages.blisEdu, // page 1
    AppImages.clubsandwich, // page 2
    AppImages.globalChallenge, // page 3
    AppImages.myDownload, // page 4
    AppImages.profile,
    AppImages.mobileSimsull,
    AppImages.ganseogu,
    AppImages.seongNam,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_precached) return;
    _precached = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _warmUpImages());
  }

  Future<void> _warmUpImages() async {
    for (final url in _warmup) {
      if (!mounted) return;
      try {
        await precacheImage(CachedNetworkImageProvider(url), context);
      } catch (_) {
        // 이미지 하나가 실패해도 Keep going
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      title: '오종현 | five bell hyun',
      theme: AppTheme.light(),
      darkTheme: AppTheme.light(),
      home: const WelcomePage(),
    );
  }
}