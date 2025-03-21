import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/components/app_images.dart';
import 'package:taoss3932_web_site/widget/d_shooting_star.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopPage0 extends StatefulWidget {
  const DesktopPage0({
    super.key,
  });

  @override
  State<DesktopPage0> createState() => _DesktopPage0State();
}

class _DesktopPage0State extends State<DesktopPage0> with TickerProviderStateMixin {
  AnimationController? controller1;
  AnimationController? controller2;
  AnimationController? controller3;
  Animation? star1;
  Animation? star2;
  Animation? star3;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(duration: const Duration(milliseconds: 4800), vsync: this)..repeat(reverse: false);
    star1 = Tween(begin: const Offset(1.0, 0.0), end: const Offset(-1.0, 1.2)).animate(controller1!);

    Future.delayed(const Duration(milliseconds: 800), (){
      controller2 = AnimationController(duration: const Duration(milliseconds: 4800), vsync: this)..repeat(reverse: false);
      star2 = Tween(begin: const Offset(0.9, -0.1), end: const Offset(-1.1, 0.9)).animate(controller2!);
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 1680), (){
      controller3 = AnimationController(duration: const Duration(milliseconds: 4800), vsync: this)..repeat(reverse: false);
      star3 = Tween(begin: const Offset(1.1, 0.1), end: const Offset(-0.9, 1.3)).animate(controller3!);
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller1?.dispose();
    controller2?.dispose();
    controller3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        if(controller1 != null)
        AnimatedBuilder(
          animation: controller1!,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(star1!.value.dx * MediaQuery.of(context).size.width, star1!.value.dy * MediaQuery.of(context).size.height),
              child: CustomPaint(
                painter: DStarPainter(),
              ),
            );
          }
        ),
        if(controller2 != null)
        AnimatedBuilder(
          animation: controller2!,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(star2!.value.dx * MediaQuery.of(context).size.width, star2!.value.dy * MediaQuery.of(context).size.height),
              child: CustomPaint(
                painter: DStarPainter(),
              ),
            );
          }
        ),
        if(controller3 != null)
        AnimatedBuilder(
          animation: controller3!,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(star3!.value.dx * MediaQuery.of(context).size.width, star3!.value.dy * MediaQuery.of(context).size.height),
              child: CustomPaint(
                painter: DStarPainter(),
              ),
            );
          }
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                const Text("What I did.", style: TextStyle(fontSize: 17, color: Colors.white60),),
                const SizedBox(height: 50,),
                const Text("# 01", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white60),),
                const SizedBox(height: 10,),
                const Text("꿈의 필름", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),),
                const SizedBox(height: 30,),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CachedNetworkImage(imageUrl: AppImages.dreamFilmIcon, fit: BoxFit.cover,)),
                ),
                const SizedBox(height: 80,)
              ]
            ),
        
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Spacer(flex: 55,),
              const Text(
              "[플랫폼] : Android, IOS\n\n"
              "[타겟층] : 20~30대\n", style: TextStyle(fontSize: 17, color: Colors.white60),),
              Container(
                width: size.width - 1000,
                alignment: Alignment.center,
                child: const Text("[About] : 인공지능 루아가 분석해주는 꿈해몽 일기장인 '꿈의 필름'입니다. "
                "사용자들이 간편하면서 동시에 섬세하게 기록할 수 있도록 구성하였으며, "
                "작성한 꿈을 바탕으로 인공지능이 분석 & 해몽해주는 스마트 꿈 일기장입니다. ", style: TextStyle(fontSize: 17, color: Colors.white60),),
              ),
              const Text("This project covers android, ios platforms with one code.\n", style: TextStyle(color: Colors.white60),),
              const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                InkWell(
                  onTap: _launchDreamFilmIOSUrl,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(CupertinoIcons.bag_fill, color: Colors.white60,),
                    Text("  Apple Store", style: TextStyle(color: Colors.white60, fontSize: 17),),
                  ],),
                ),
                InkWell(
                  onTap: _launchDreamFilmAPKUrl,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.shop, color: Colors.white60,),
                    Text("  Play Store", style: TextStyle(color: Colors.white60, fontSize: 17),),
                  ],),
                ),
              ]),
              const Spacer(flex: 45,)
            ],),
          ],
        ),
      ],
    );
  }
}

Future<void> _launchDreamFilmAPKUrl() async {
  if (!await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.appybuilder.taoss3932.earnmoney&pli=1'))) {
    throw 'Could not launch https://play.google.com/store/apps/details?id=com.appybuilder.taoss3932.earnmoney&pli=1';
  }
}

Future<void> _launchDreamFilmIOSUrl() async {
  if (!await launchUrl(Uri.parse('https://apps.apple.com/us/app/%EA%BF%88%EC%9D%98-%ED%95%84%EB%A6%84-%EC%9D%B8%EA%B3%B5%EC%A7%80%EB%8A%A5-%EB%A3%A8%EC%95%84%EA%B0%80-%EB%B6%84%EC%84%9D%ED%95%B4%EC%A3%BC%EB%8A%94-%EA%BF%88%ED%95%B4%EB%AA%BD-%EC%9D%BC%EA%B8%B0%EC%9E%A5/id6445881163'))) {
    throw 'Could not launch https://apps.apple.com/us/app/%EA%BF%88%EC%9D%98-%ED%95%84%EB%A6%84-%EC%9D%B8%EA%B3%B5%EC%A7%80%EB%8A%A5-%EB%A3%A8%EC%95%84%EA%B0%80-%EB%B6%84%EC%84%9D%ED%95%B4%EC%A3%BC%EB%8A%94-%EA%BF%88%ED%95%B4%EB%AA%BD-%EC%9D%BC%EA%B8%B0%EC%9E%A5/id6445881163';
  }
}