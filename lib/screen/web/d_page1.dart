import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/components/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopPage1 extends StatelessWidget {
  const DesktopPage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("What I did.", style: TextStyle(fontSize: 17),),
          const SizedBox(height: 50,),
          const Text("# 02", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 10,),
          const Text("(주)BLIS EDU LMS", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 30,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              child: CachedNetworkImage(imageUrl: AppImages.blisEdu, fit: BoxFit.cover,)),
          ),
          const SizedBox(height: 80,)
        ]),

        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(flex: 55,),
          const Text("[플랫폼] : Web, Android, IOS\n\n"
          "[타겟층] : 학원 수강생\n", style: TextStyle(fontSize: 17),),
          Container(
            width: size.width - 1000,
            alignment: Alignment.center,
            child: const Text("[About] : 모바일, 태블릿, PC 등 다양한 OS에 대응하는 원코드 반응형 UI를 적용하고, "
            "Clean Architecture(MVVM 구조)로 추후 유지보수성을 고려하며 작업했습니다. "
            "\n네이티브별 충돌이 발생하지 않도록 웹뷰 컨트롤러와 overRiding, "
            "전체화면 컨트롤링, 디테일한 FCM 푸시 알림, 다운로더 컨트롤, JS 핸들러 부분을 담당했습니다.", style: TextStyle(fontSize: 17),),
          ),
          const Text("This project covers web, android, ios platforms with one code.\n"),

          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: _launchWebUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(CupertinoIcons.globe, color: Colors.black54,),
                Text("  Web", style: TextStyle(color: Colors.black54, fontSize: 17),),
              ],),
            ),
            InkWell(
              onTap: _launchIOS,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(CupertinoIcons.bag_fill, color: Colors.black54,),
                Text("  AppStore", style: TextStyle(color: Colors.black54, fontSize: 17),),
              ],),
            ),
            InkWell(
              onTap: _launchAndroid,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.shop, color: Colors.black54,),
                Text("  PlayStore", style: TextStyle(color: Colors.black54, fontSize: 17),),
              ],),
            ),
          ]),
          const Spacer(flex: 45,)
        ],),
      ],
    );
  }
}


Future<void> _launchWebUrl() async {
  if (!await launchUrl(Uri.parse('https://lms.blisedu.co.kr/'))) {
    throw 'Could not launch https://lms.blisedu.co.kr/';
  }
}

Future<void> _launchAndroid() async {
  if (!await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.blisedu.lms'))) {
    throw 'Could not launch https://play.google.com/store/apps/details?id=com.blisedu.lms';
  }
}

Future<void> _launchIOS() async {
  if (!await launchUrl(Uri.parse('https://apps.apple.com/it/app/blis-%ED%8E%B8%EC%9E%85-lms/id6739446411'))) {
    throw 'Could not launch https://apps.apple.com/it/app/blis-%ED%8E%B8%EC%9E%85-lms/id6739446411';
  }
}