import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/components/app_images.dart';
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
      const Text("What I did.", style: TextStyle(fontSize: 17),),
      SizedBox(height: size.height / 71.5),
      const Text("# 03", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 71.5,), //10
      const Text("Garden Us", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 24,), //30
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          child: CachedNetworkImage(
            imageUrl: AppImages.clubsandwich, 
            fit: BoxFit.cover,
          )
        ),
      ),
      SizedBox(height: size.height / 24,), //30
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              InkWell(
                onTap: _launchClubSandwichWebUrl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                  Icon(CupertinoIcons.globe, color: Colors.black54,),
                  Text("  Web service", style: TextStyle(color: Colors.black54),),
                ],),
              ),
            ]),),
        ),

        const Expanded(
          child: Text("대학생 전용 소개팅 플랫폼인 Garden Us입니다. "
          "결제 시스템, 시즌 시스템, 매칭 시스템, 채팅 시스템 등을 구현하였습니다.  "),
        ),
      ],),
    ]);
  }
}


Future<void> _launchClubSandwichWebUrl() async {
  if (!await launchUrl(Uri.parse('https://gardenus-kr.web.app/#/'))) {
    throw 'Could not launch https://gardenus-kr.web.app/#/';
  }
}