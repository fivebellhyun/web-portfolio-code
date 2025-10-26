import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/components/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopPage3 extends StatelessWidget {
  const DesktopPage3({
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
          const Text("Global TOP 20위 진출", style: TextStyle(fontSize: 17, color: Colors.black54),),
          const SizedBox(height: 50,),
          const Text("# 04", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),),
          const SizedBox(height: 10,),
          const Text("Global Gamers Challenge", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 30,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              child: CachedNetworkImage(
                imageUrl: AppImages.globalChallenge, 
                fit: BoxFit.cover,
                width: size.width / 3,
              )
            ),
          ),
          const SizedBox(height: 80,)
        ]),

        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(flex: 55,),
          const Text("[개발 기여도] : 50 %\n\n"
          "[플랫폼] : Web, Android, IOS\n\n"
          "[순위] : Top 20\n", style: TextStyle(color: Colors.black54, fontSize: 17),),
          Container(
            width: size.width - 1000 < 280 ? 280 : size.width - 1000,
            alignment: Alignment.center,
            child: const Text("[About] : Global Citizen & Google Flutter에서 공동주최한 세계 대회에서 12위 성적을 거두었습니다. "
            "Flutter에서 새로이 선보인 Flame engine을 사용하여 6인용 realtime 2D 게임을 구현하였습니다.\n", style: TextStyle(color: Colors.black54, fontSize: 17),),
          ),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              InkWell(
                onTap: _launchWebUrl,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(CupertinoIcons.globe, color: Colors.black54,),
                  Text("  About Challenge", style: TextStyle(color: Colors.black54),),
                ],),
              ),
              InkWell(
                onTap: _launchGameUrl,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(CupertinoIcons.game_controller, color: Colors.black54,),
                  Text("  Web game", style: TextStyle(color: Colors.black54, fontSize: 17),),
                ],),
              ),
              InkWell(
                onTap: _launchTop20Url,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.play_arrow_rounded, color: Colors.black54,),
                  Text("  Top 20 진출 영상", style: TextStyle(color: Colors.black54),),
                ],),
              ),
            ]
          ),
          const Spacer(flex: 45,)
        ],),
      ],
    );
  }
}

Future<void> _launchGameUrl() async {
  if (!await launchUrl(Uri.parse('https://sinkingus.web.app/'))) {
    throw 'Could not launch https://sinkingus.web.app/';
  }
}

Future<void> _launchTop20Url() async {
  if (!await launchUrl(Uri.parse('https://youtu.be/AqCMFhb2wrA?si=AEwFLFPNjkJUFFo3&t=110'))) {
    throw 'Could not launch https://youtu.be/AqCMFhb2wrA?si=AEwFLFPNjkJUFFo3&t=110';
  }
}

Future<void> _launchWebUrl() async {
  if (!await launchUrl(Uri.parse('https://flutter.dev/global-gamers'))) {
    throw 'Could not launch https://flutter.dev/global-gamers';
  }
}