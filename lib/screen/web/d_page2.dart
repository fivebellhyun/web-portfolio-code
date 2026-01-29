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
    precacheImage(const CachedNetworkImageProvider(AppImages.ganseogu), context);
    precacheImage(const CachedNetworkImageProvider(AppImages.seongNam), context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 80,),
          const Text("What I did.", style: TextStyle(fontSize: 17),),
          const SizedBox(height: 10,),
          const Text("# 03", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 10,),
          const Text("심술난 연구소", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 30,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              child: CachedNetworkImage(
                imageUrl: AppImages.clubsandwich, 
                fit: BoxFit.cover,
                width: size.width / 4,
              )
            ),
          ),
          const SizedBox(height: 80,)
        ]),

        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Spacer(flex: 55,),
          Container(
            width: size.width - 1000 < 300 ? 300 : size.width - 1000,
            alignment: Alignment.center,
            child: const Text("[About] : 실시간 웹 보드게임 솔루션\n"
            "기업 및 공공기관 교육용으로 최적화한 실시간 웹 기반 보드게임입니다. "
            "별도의 설치 없이도 웹 환경에서 쾌적하게 작동하도록 설계하였으며, "
            "대규모 인원이 참여하는 라이브 세미나에서도 안정적인 실시간 통신 환경을 구축하였습니다.", style: TextStyle(fontSize: 17),),
          ),
          const Text(
            "\n[주요 레퍼런스]",
            style: TextStyle(
              fontSize: 14, 
            )
          ),
          InkWell(
            onTap: () {
              _showEnlargedImage(context, AppImages.ganseogu);
            },
            child: const Text(
              "강서구청: 신규 임용 공무원 교육 세미나",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14, 
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _showEnlargedImage(context, AppImages.lotte);
            },
            child: const Text(
              "롯데 GRS: 조직력 강화 팀빌딩 트레이닝",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14, 
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _showEnlargedImage(context, AppImages.seongNam);
            },
            child: const Text(
              "성남도시개발공사: 신입 사원 온보딩 프로그램",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14, 
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 12,),

          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: _launchClubSandwichWebUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(CupertinoIcons.globe, color: Colors.black54,),
                Text("  캐리비안 베일", style: TextStyle(color: Colors.black54, fontSize: 17),),
              ],),
            ),
            InkWell(
              onTap: _launchGood9WebUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(CupertinoIcons.globe, color: Colors.black54,),
                Text("  Good Nine", style: TextStyle(color: Colors.black54, fontSize: 17),),
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
  if (!await launchUrl(Uri.parse('https://caribbean-veil.web.app/'))) {
    throw 'Could not launch https://caribbean-veil.web.app/';
  }
}

Future<void> _launchGood9WebUrl() async {
  if (!await launchUrl(Uri.parse('https://good-nine.web.app/'))) {
    throw 'Could not launch https://good-nine.web.app/';
  }
}

void _showEnlargedImage(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    barrierDismissible: true, // 배경 클릭 시 닫기
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent, // 배경 투명하게
        insetPadding: const EdgeInsets.all(10), // 화면 여백
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            // 확대된 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain, // 전체 비율 유지
              ),
            ),
            // 닫기 버튼
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    },
  );
}