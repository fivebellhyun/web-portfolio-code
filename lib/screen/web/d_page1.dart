import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopPage1 extends StatelessWidget {
  const DesktopPage1({
    Key? key,
  }) : super(key: key);

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
          const Text("Club Sandwich", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 30,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              child: Image.asset("repo/clubsandwich.jpg", fit: BoxFit.cover,)),
          ),
          const SizedBox(height: 80,)
        ]),

        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(flex: 55,),
          const Text("[개발 기여도] : 100 %\n\n"
          "[플랫폼] : Web, Android, IOS\n\n"
          "[타겟층] : 연세대 재학생\n", style: TextStyle(fontSize: 17),),
          Container(
            width: size.width - 1000,
            alignment: Alignment.center,
            child: const Text("[About] : 연세대 <동아리.학회> 전용 플랫폼인 Club Sandwich입니다. "
            "동아리 성격 시각화, 카테고리화, 인기도에 따른 순위화된 동아리들을 보실 수 있습니다.  "
            "각 동아리의 상세한 활동과 세부정보들을 한눈에 볼 수 있으며 편리하게 지원할 수 있게 제작하였습니다.", style: TextStyle(fontSize: 17),),
          ),
          const Text("This project covers web, android, ios platforms with one code.\n"),

          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: _launchClubSandwichWebUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(CupertinoIcons.globe, color: Colors.black54,),
                Text("  Web service", style: TextStyle(color: Colors.black54, fontSize: 17),),
              ],),
            ),
            InkWell(
              onTap: _launchClubSandwichAppUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(Icons.shop, color: Colors.black54,),
                Text("  App service", style: TextStyle(color: Colors.black54, fontSize: 17),),
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
  if (!await launchUrl(Uri.parse('https://fivebellhyun.github.io/clubsandwich.io/#/'))) {
    throw 'Could not launch https://fivebellhyun.github.io/clubsandwich.io/#/';
  }
}

Future<void> _launchClubSandwichAppUrl() async {
  if (!await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=kkom.zirock.clubsandwich'))) {
    throw 'Could not launch https://play.google.com/store/apps/details?id=kkom.zirock.clubsandwich';
  }
}