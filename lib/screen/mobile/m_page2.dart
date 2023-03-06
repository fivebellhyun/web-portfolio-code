import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobilePage2 extends StatelessWidget {
  const MobilePage2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(height: size.height / 9,), //80
      const Text("What I did.", style: TextStyle(fontSize: 17, color: Colors.black54),),
      SizedBox(height: size.height / 14.3,), //50
      const Text("# 03", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),),
      SizedBox(height: size.height / 71.5,), //10
      const Text("마포고 출석체크", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),),
      SizedBox(height: size.height / 24,), //30
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          child: Image.asset("repo/school_apk_img.png", fit: BoxFit.cover,)),
      ),
      SizedBox(height: size.height / 24,), //30
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            InkWell(
              onTap: _launchMapoAppUrl,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                Icon(Icons.shop, color: Colors.black54,),
                Text("  App service", style: TextStyle(color: Colors.black54),),
              ],),
            ),
          ]),),

        const Expanded(
          child: Text("코로나 시대에 국가 공식 출석체크가 없었을 무렵, 마포고등학교 전용 출석체크 어플을 통해 출석체크를 할 수 있도록 제작하였습니다. "
          "보안을 강화하여 대리출석 방지, 출석 조작을 방지함과 동시에 간편히 버튼 한번만 누르면 출석이 되도록 설계하였습니다.  "
          "", style: TextStyle(color: Colors.black54),),
        ),
      ],),
    ]);
  }
}

Future<void> _launchMapoAppUrl() async {
  if (!await launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.mapocheck.quzan'))) {
    throw 'Could not launch https://play.google.com/store/apps/details?id=com.mapocheck.quzan';
  }
}