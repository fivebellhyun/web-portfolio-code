import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/Components/drawer.dart';
import 'package:taoss3932_web_site/responsive.dart';
import 'package:taoss3932_web_site/screen/mobile/m_mainpage.dart';
import 'package:taoss3932_web_site/screen/web/d_mainpage.dart';

class WelcomePage extends StatefulWidget{
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isPressed = true;

  final CarouselController _carouselController = CarouselController();

  @override 
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    Offset distanse = isPressed ? const Offset(10, 10) : const Offset(30, 30);
    double blur = isPressed ? 5.0 : 30.0;
    
    return Scaffold(
      drawer: Responsive.isDesktop(context) ? null : const Drawer(child: MyDrawer()),
      body: Stack(
        children: [
          Row(children: [
            Responsive.isDesktop(context) ? const MyDrawer() : const SizedBox.shrink(),
            Expanded(
              flex: 7,
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: size.height,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                  onScrolled: (_){},
                ),
                items: [
                  aboutWelcome(context, size, blur, distanse),
                  !Responsive.isDesktop(context) ? MobileMainPage(size: size) : DesktopMainPage(size: size),
                ],
              )),
          ],),
          Responsive.isDesktop(context) ? const SizedBox.shrink() : Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu, color: Colors.black, size: 30,)))
        ],
      ),
    );
  }

  Container aboutWelcome(BuildContext context, Size size, double blur, Offset distanse) {
    return Container(
      color: const Color.fromARGB(255, 253, 249, 239),
      child: Column(children: [
        SizedBox(
          height: size.height,
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: size.width*0.1,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('안녕하세요.', style: TextStyle(fontSize: 17),),
                  SizedBox(
                    height: 83,
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText("부드럽게. \n그러나 강렬하게.", textStyle: const TextStyle(color: Colors.black, fontSize: 30), speed: const Duration(milliseconds: 150)),
                        TypewriterAnimatedText("아름답게. \n그리고 세련되게.", textStyle: const TextStyle(color: Colors.black, fontSize: 30), speed: const Duration(milliseconds: 150)),
                        TypewriterAnimatedText("쫀득하게. \n그러나 유연하게.", textStyle: const TextStyle(color: Colors.black, fontSize: 30), speed: const Duration(milliseconds: 150)),
                      ]
                    ),
                  ),
                  const Text('디자인하는 Flutter 개발자 오종현입니다.', style: TextStyle(fontSize: 17),),
                  const SizedBox(height: 50,),
                  Responsive.isMobile(context) ? goBtn(context, blur, distanse) : const SizedBox.shrink(),
                ],
              ),
              const Spacer(),
              !Responsive.isMobile(context) ? goBtn(context, blur, distanse) : const SizedBox.shrink(),
              const Spacer()
            ]),
          ),
        ),
      ]),
    );
  }

  GestureDetector goBtn(BuildContext context, double blur, Offset distanse) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isPressed = !isPressed;
        });
        _carouselController.nextPage(duration: const Duration(milliseconds: 3000), curve: Curves.fastLinearToSlowEaseIn);
      },
      child: MouseRegion(
        onEnter: (_){
          setState(() {
            isPressed = false;
          });
        },
        onExit: (_) {
          setState(() {
            isPressed = true;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: !Responsive.isMobile(context) ? 200 : 80,
          width: !Responsive.isMobile(context) ? 200 : 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 253, 249, 239),
            boxShadow: [
              BoxShadow(
                blurRadius: blur,
                offset: -distanse,
                color: const Color.fromARGB(255, 254, 252, 248),
              ),
              BoxShadow(
                blurRadius: blur,
                offset: distanse,
                color: const Color(0xFFA7A9AF),
              )
            ]
          ),
          child: Center(child: Icon(CupertinoIcons.arrow_right, size: Responsive.isDesktop(context) ? 100 : 40, color: Colors.black54,)),
        ),
      ),
    );
  }
}