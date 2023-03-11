import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobilePage1 extends StatelessWidget {
  const MobilePage1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(height: size.height / 9,), //80
      const Text("What I did.", style: TextStyle(fontSize: 17),),
      SizedBox(height: size.height / 14.3,), //50
      const Text("# 02", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 71.5,), //10
      const Text("Club Sandwich", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 24,), //30
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          child: Image.asset("repo/clubsandwich.jpg", fit: BoxFit.cover,)),
      ),
      SizedBox(height: size.height / 24,), //30
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: _launchClubSandwichWebUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(CupertinoIcons.globe, color: Colors.black54,),
                Text("  Web service", style: TextStyle(color: Colors.black54),),
              ],),
            ),
            InkWell(
              onTap: _launchClubSandwichAppUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(Icons.shop, color: Colors.black54,),
                Text("  App service", style: TextStyle(color: Colors.black54),),
              ],),
            ),
          ]),),

        const Expanded(
          child: Text("연세대 <동아리.학회> 전용 플랫폼인 Club Sandwich입니다. "
          "동아리 성격 시각화, 카테고리화, 인기도에 따른 순위화된 동아리들을 보실 수 있습니다.  "
          "각 동아리의 상세한 활동과 세부정보들을 한눈에 볼 수 있으며 편리하게 지원할 수 있게 제작하였습니다."),
        ),
      ],),
    ]);
  }
}


Future<void> _launchClubSandwichWebUrl() async {
  if (!await launchUrl(Uri.parse('https://fivebellhyun.github.io/clubsandwich.io/#/'))) {
    throw 'Could not launch https://fivebellhyun.github.io/clubsandwich.io/#/';
  }
}

Future<void> _launchClubSandwichAppUrl() async {
  if (!await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=kkom.zirock.clubsandwich'))) {
    throw 'Could not launch https://play.google.com/store/apps/details?id=kkom.zirock.clubsandwich';
  }
}