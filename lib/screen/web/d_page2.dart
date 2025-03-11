import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/components/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopPage2 extends StatelessWidget {
  const DesktopPage2({
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
          const Text("# 03", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 10,),
          const Text("Garden Us", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 30,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              child: CachedNetworkImage(imageUrl: AppImages.clubsandwich, fit: BoxFit.cover,)),
          ),
          const SizedBox(height: 80,)
        ]),

        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(flex: 55,),
          const Text("[플랫폼] : Web, Android, IOS\n\n"
          "[타겟층] : 대학생\n", style: TextStyle(fontSize: 17),),
          Container(
            width: size.width - 1000,
            alignment: Alignment.center,
            child: const Text("[About] : 대학생 전용 소개팅 플랫폼인 Garden Us입니다. "
            "결제 시스템, 시즌 시스템, 매칭 시스템, 채팅 시스템 등을 구현하였습니다.  "
            "모바일, PC, 등 어느 플랫폼에서나 동일하게 쾌적한 서비스를 이용할 수 있도록 고도화하였습니다.", style: TextStyle(fontSize: 17),),
          ),
          const Text("This project covers web, android, ios platforms with one code.\n"),

          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: _launchClubSandwichWebUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(CupertinoIcons.globe, color: Colors.black54,),
                Text("  Web service", style: TextStyle(color: Colors.black54, fontSize: 17),),
              ],),
            ),
          ]),
          const Spacer(flex: 45,)
        ],),
      ],
    );
  }
}


Future<void> _launchClubSandwichWebUrl() async {
  if (!await launchUrl(Uri.parse('https://gardenus-kr.web.app/#/'))) {
    throw 'Could not launch https://gardenus-kr.web.app/#/';
  }
}