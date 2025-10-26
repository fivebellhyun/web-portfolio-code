import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopLastPage extends StatefulWidget {
  const DesktopLastPage({
    super.key,
  });

  @override
  State<DesktopLastPage> createState() => _DesktopLastPageState();
}

class _DesktopLastPageState extends State<DesktopLastPage> {
  bool glowing = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Contact.", style: TextStyle(fontSize: 17),),
          SizedBox(height: 50,),
          Text("단순히\n주어진 코딩을\n찍어내는 것이 아닌\n최적의 사용자 경험을 제공하는\nFlutter dev. 오종현이 되겠습니다.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
        ]),

        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
          const Spacer(flex: 60,),
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
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: size.width < 1280 ? 100 : size.width * 0.3
              ),
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
                    width: 240,
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
                      Text("전체 경력 확인하고 의뢰하기  ", style: TextStyle(color: Colors.white),),
                      Icon(Icons.play_arrow_rounded, color: Colors.white,),
                    ],),),
                ),
              ),
            ],
          ),
          const Spacer(flex: 40,)
        ],),
      ],
    );
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