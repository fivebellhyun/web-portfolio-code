import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/Components/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class MobilePage2 extends StatelessWidget {
  const MobilePage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(height: size.height / 9,), //80
      const Text("Global TOP 20위 진출", style: TextStyle(fontSize: 17, color: Colors.black54),),
      SizedBox(height: size.height / 14.3,), //50
      const Text("# 03", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),),
      SizedBox(height: size.height / 71.5,), //10
      const Text("Global Gamers Challenge", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 24,), //30
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          child: Image.asset(AppImages.globalChallenge, fit: BoxFit.cover,)),
      ),
      SizedBox(height: size.height / 24,), //30
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  Icon(CupertinoIcons.globe, color: Colors.black54,),
                  Text("  Web game", style: TextStyle(color: Colors.black54),),
                ],),
              ),
              InkWell(
                onTap: _launchTop20Url,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(CupertinoIcons.globe, color: Colors.black54,),
                  Text("  Top 20 진출 영상", style: TextStyle(color: Colors.black54),),
                ],),
              ),
            ]),
          ),

        const Expanded(
          child: Text("Global Citizen & Google Flutter에서 공동주최한 세계 대회에서 12위 성적을 거두었습니다. "
          "Flutter에서 새로이 선보인 Flame engine을 사용하여 6인용 realtime 2D 게임을 구현하였습니다. "
          "", style: TextStyle(color: Colors.black54),),
        ),
      ],),
    ]);
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