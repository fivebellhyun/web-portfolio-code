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
    precacheImage(const CachedNetworkImageProvider(AppImages.ganseogu), context);
    precacheImage(const CachedNetworkImageProvider(AppImages.seongNam), context);

    return Column(children: [
      SizedBox(height: size.height / 9,), //80
      const Text("What I did.", style: TextStyle(fontSize: 17),),
      SizedBox(height: size.height / 71.5),
      const Text("# 03", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 71.5,), //10
      const Text("심술난 연구소", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 24,), //30
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          child: CachedNetworkImage(
            imageUrl: AppImages.mobileSimsull,
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
                  Text("  캐리비안 베일", style: TextStyle(color: Colors.black54),),
                ],),
              ),
              InkWell(
                onTap: _launchGood9WebUrl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                  Icon(CupertinoIcons.globe, color: Colors.black54,),
                  Text("  Good Nine", style: TextStyle(color: Colors.black54),),
                ],),
              ),
            ]),),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("기업 및 공공기관 교육용으로 최적화한 실시간 웹 기반 보드게임입니다. "
                "별도의 설치 없이도 웹 환경에서 쾌적하게 작동하도록 설계하였으며, "
                "대규모 인원이 참여하는 라이브 세미나에서도 안정적인 실시간 통신 환경을 구축하였습니다."
              ),
              const Text(
                "\n[주요 레퍼런스]",
                style: TextStyle(
                  fontSize: 13, 
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
                    fontSize: 13, 
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
                    fontSize: 13, 
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
                    fontSize: 12, 
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 12,),
            ],
          ),
        ),
      ],),
    ]);
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