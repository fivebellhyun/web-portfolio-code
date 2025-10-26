import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taoss3932_web_site/components/app_images.dart';
import 'package:taoss3932_web_site/components/app_svgs.dart';
import 'package:taoss3932_web_site/helper/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff242430),
      child: ListView(padding: EdgeInsets.zero, children: [
        const AboutMe(),
        Container(
          color: const Color(0xff242430),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Attending', style: TextStyle(color: Colors.white),),
                Text('성균관대학교(SKKU)', style: TextStyle(color: Colors.white70))
              ],),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Graduate', style: TextStyle(color: Colors.white),),
                Text('마포고등학교(과학중점)', style: TextStyle(color: Colors.white70))
              ],),
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //   const Text('Age', style: TextStyle(color: Colors.white),),
              //   Text(
              //     '${
              //       DateTime.now().month >= 9 
              //         ? DateTime.now().year - 2003 
              //         : DateTime.now().year - 2004
              //       }(Korean age : ${DateTime.now().year - 2002})'
              //   )
              // ],),
              const Divider(color: Color.fromARGB(255, 139, 140, 148),),
              const SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft, child: const Text('Skills', style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: AboutSkill(title: "Flutter", persent: 0.95,)),
                  SizedBox(width: 15,),
                  Expanded(child: AboutSkill(title: "Admob", persent: 0.78,)),
                  SizedBox(width: 15,),
                  Expanded(child: AboutSkill(title: "Firebase", persent: 0.63,)),
                ],
              ),
              const Divider(color: Color.fromARGB(255, 139, 140, 148),),
              const SizedBox(height: 10,),
              Container(alignment: Alignment.centerLeft, child: const Text('Tech Stack', style: TextStyle(color: Colors.white))),
              const SizedBox(height: 10,),
              const AboutCode(title: "Flutter_(android,ios,web)", percent: 0.95,),
              const SizedBox(height: 15,),
              const AboutCode(title: "Node.js", percent: 0.37,),
              const SizedBox(height: 15,),
              const AboutCode(title: "Kotlin_(for flutter)", percent: 0.14,),
              const SizedBox(height: 15,),
              const AboutCode(title: "Swift_(for flutter)", percent: 0.14,),

              const SizedBox(height: 10,),
              const Divider(color: Color.fromARGB(255, 139, 140, 148),),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 56, 75),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  IconButton(
                    onPressed: () async {
                      Uri url = Uri.parse('https://github.com/fivebellhyun');
                      if(await canLaunchUrl(url)){
                        await launchUrl(url);
                      }
                    },
                    icon: SvgPicture.network(
                      AppSVGs.github,
                      width: 24,
                      fit: BoxFit.fitWidth,
                      colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                    )
                  ),
                  IconButton(
                    onPressed: () async {
                      Uri url = Uri.parse('https://www.linkedin.com/in/fivebellhyun');
                      if(await canLaunchUrl(url)){
                        await launchUrl(url);
                      }
                    },
                    icon: SvgPicture.network(
                      AppSVGs.linkedin,
                      width: 24,
                      fit: BoxFit.fitWidth,
                      colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                    )
                  ),
                  IconButton(
                    onPressed: (){
                      launchUrl(Uri(
                        scheme: 'mailto',
                        path: 'taoss3932@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                        })
                      ));
                    }, 
                    icon: const Icon(Icons.email)
                  ),
                ]),
              ),
              const SizedBox(height: 50,)
            ]),
          ),
        )
      ],),
    );
  }
}


class AboutCode extends StatelessWidget {
  const AboutCode({
    super.key,
    required this.title,
    required this.percent,
  });

  final String title;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: percent), duration: const Duration(milliseconds: 1500), builder: (context, double value, child) {
        return Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(title, style: const TextStyle(color: Colors.white70)),
              Text("${(value * 100).toInt()}%", style: const TextStyle(color: Colors.white70),)
            ],),
            const SizedBox(height: 5,),
            LinearProgressIndicator(
              value: value,
              color: Colors.lightBlue,
              backgroundColor: const Color(0xff242430),
            ),
          ],
        );
      });
  }
}

class AboutSkill extends StatelessWidget {
  const AboutSkill({
    super.key,
    required this.title,
    required this.persent
  });

  final String title;
  final double persent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: persent), 
            duration: const Duration(seconds: 1), 
            builder: (context, double value, child){
              return Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: value,
                    color: Colors.lightBlue,
                    backgroundColor: const Color(0xff242430),),
                  Center(
                    child: Text("${(value * 100).toInt()}%", style: const TextStyle(color: Colors.white, fontSize: 20),),
                  )
                ],
              );
            }),
        ),
        const SizedBox(height: 10,),
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
      ],
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: const Color(0xff242430),
        child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 10,),
          Row(children: [
            SizedBox(width: 5,),
            Text(
              'fivebellhyun\'s Portfolio', 
              style: TextStyle(
                fontSize: 17, 
                fontWeight: FontWeight.bold,
                color: Colors.white70
              )
            ),
          ]),
          Spacer(flex: 2,),
          CircleAvatar(
            radius: 50,
            backgroundImage: CachedNetworkImageProvider(
              AppImages.profile
            ),
          ),
          Text("Jonghyun Oh", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          Text(
            "Flutter(Dart) developer", 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w200, 
              height: 1.5,
              color: Colors.white70
            ),
          ),
          Spacer(flex: 2,)
        ],),
      ),);
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}