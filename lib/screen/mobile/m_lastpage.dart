import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileLastPage extends StatefulWidget {
  const MobileLastPage({super.key});

  @override
  State<MobileLastPage> createState() => _MobileLastPageState();
}

class _MobileLastPageState extends State<MobileLastPage> {
  bool glowing = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(children: [
      const Spacer(flex: 3),
      const SizedBox(height: 80,),
      const Text("Contact.", style: TextStyle(fontSize: 17, color: Colors.black54),),
      const SizedBox(height: 50,),
      SizedBox(
        width: size.width * 0.8,
        child: const Text("단순히\n주어진 코딩을\n찍어내는 것이 아닌\n최적의 사용자 경험을 제공하는\nFlutter dev. 오종현이 되겠습니다.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),)),
      const SizedBox(height: 30,),
      const InkWell(
        onTap: _launchKakaoUrl,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Icon(CupertinoIcons.bubble_left_bubble_right_fill, color: Colors.black54,),
          Text("  kakao : bishop03", style: TextStyle(color: Colors.black54),),
        ],),
      ),
      InkWell(
        onTap: (){
          launchUrl(Uri(
            scheme: 'mailto',
            path: 'taoss3932@gmail.com',
            query: encodeQueryParameters(<String, String>{
            })
          ));
        },
        child: const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Icon(Icons.email, color: Colors.black54,),
          Text("  taoss3932@gmail.com", style: TextStyle(color: Colors.black54),),
        ],),
      ),
      const SizedBox(height: 30,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: _launchContactUrl,
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  glowing = true;
                });
              },
              onExit: (_) {
                setState(() {
                  glowing = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 70),
                height: 48,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(colors: [
                    Colors.pinkAccent,
                    Colors.indigoAccent
                  ]),
                  boxShadow: glowing ? [
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.6),
                      spreadRadius: 1.0,
                      blurRadius: 16,
                      offset: const Offset(-8, 0)
                    ),
                    BoxShadow(
                      color: Colors.indigoAccent.withOpacity(0.6),
                      spreadRadius: 1.0,
                      blurRadius: 16,
                      offset: const Offset(8, 0)
                    ),
                    BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(-8, 0)
                    ),
                    BoxShadow(
                      color: Colors.indigoAccent.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(8, 0)
                    )
                  ] : []
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                  Text("  프로젝트 의뢰하기", style: TextStyle(color: Colors.white),),
                ],),),
            ),
          ),
        ],
      ),
      const Spacer(flex: 7,)
    ]);
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Future<void> _launchKakaoUrl() async {
  if (!await launchUrl(Uri.parse('https://open.kakao.com/o/sOQutMId'))) {
    throw 'Could not launch https://open.kakao.com/o/sOQutMId';
  }
}

Future<void> _launchContactUrl() async {
  if (!await launchUrl(Uri.parse('https://kmong.com/gig/487571'))) {
    throw 'Could not launch https://kmong.com/gig/487571';
  }
}