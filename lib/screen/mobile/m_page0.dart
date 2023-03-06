import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobilePage0 extends StatelessWidget {
  const MobilePage0({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(height: size.height / 9,), //80
      const Text("What I did.", style: TextStyle(fontSize: 17, color: Colors.black54),),
      SizedBox(height: size.height / 14.3,), //50
      const Text("# 01", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),),
      SizedBox(height: size.height / 71.5,), //10
      const Text("꿈의 필름", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 24,), //30
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset("repo/dreamfilm.png", width: size.width / 3, height: size.width / 3,fit: BoxFit.cover,)),
      ),
      SizedBox(height: size.height / 24,), //30
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: _launchDreamFilmIOSUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(CupertinoIcons.bag_fill, color: Colors.black54,),
                Text("  Apple Store", style: TextStyle(color: Colors.black54),),
              ],),
            ),
            InkWell(
              onTap: _launchDreamfilmAPKUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(Icons.shop, color: Colors.black54,),
                Text("  Play Store", style: TextStyle(color: Colors.black54),),
              ],),
            ),
          ]),),

        const Expanded(
          child: Text("인공지능 루아가 분석해주는 꿈해몽 일기장인 '꿈의 필름'입니다. "
          "사용자들이 간편하면서 동시에 섬세하게 기록할 수 있도록 구성하였으며, "
          "이렇게 작성한 꿈을 바탕으로 인공지능이 분석해주는 스마트 꿈 일기장입니다.", style: TextStyle(color: Colors.black54),),
        ),
      ],),
    ]);
  }
}

Future<void> _launchDreamfilmAPKUrl() async {
  if (!await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.appybuilder.taoss3932.earnmoney&pli=1'))) {
    throw 'Could not launch https://play.google.com/store/apps/details?id=com.appybuilder.taoss3932.earnmoney&pli=1';
  }
}

Future<void> _launchDreamFilmIOSUrl() async {
  if (!await launchUrl(Uri.parse('https://apps.apple.com/us/app/%EA%BF%88%EC%9D%98-%ED%95%84%EB%A6%84-%EC%9D%B8%EA%B3%B5%EC%A7%80%EB%8A%A5-%EB%A3%A8%EC%95%84%EA%B0%80-%EB%B6%84%EC%84%9D%ED%95%B4%EC%A3%BC%EB%8A%94-%EA%BF%88%ED%95%B4%EB%AA%BD-%EC%9D%BC%EA%B8%B0%EC%9E%A5/id6445881163'))) {
    throw 'Could not launch https://apps.apple.com/us/app/%EA%BF%88%EC%9D%98-%ED%95%84%EB%A6%84-%EC%9D%B8%EA%B3%B5%EC%A7%80%EB%8A%A5-%EB%A3%A8%EC%95%84%EA%B0%80-%EB%B6%84%EC%84%9D%ED%95%B4%EC%A3%BC%EB%8A%94-%EA%BF%88%ED%95%B4%EB%AA%BD-%EC%9D%BC%EA%B8%B0%EC%9E%A5/id6445881163';
  }
}