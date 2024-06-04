import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/Components/drawer.dart';
import 'package:taoss3932_web_site/responsive.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double boxwidth = 100;
  double boxheight = 50;
  Color boxColor = const Color.fromARGB(255, 253, 249, 239);
  
  @override 
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Responsive.isDesktop(context) 
        ? null 
        : AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 253, 249, 239),
          
        ),
      drawer: const MyDrawer(),
      body: Row(children: [
        Responsive.isDesktop(context) ? const MyDrawer() : const SizedBox.shrink(),
        Expanded(
          flex: 7,
          child: Container(
            color: const Color.fromARGB(255, 253, 249, 239),
            child: Column(children: [
              Responsive.isDesktop(context) ? const SizedBox(height: 80,) : const SizedBox.shrink(),
              SizedBox(
                height: size.height - 80,
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
                          child: AnimatedTextKit(animatedTexts: [
                            TyperAnimatedText("부드럽게. \n그러나 강렬하게.", textStyle: const TextStyle(color: Colors.black, fontSize: 30)),
                            TyperAnimatedText("아름답게. \n그리고 세련되게.", textStyle: const TextStyle(color: Colors.black, fontSize: 30)),
                            TyperAnimatedText("쫀득하게. \n그러나 유연하게.", textStyle: const TextStyle(color: Colors.black, fontSize: 30)),
                          ]),
                        ),
                        const Text('디자인하는 Flutter 개발자 오종현입니다.', style: TextStyle(fontSize: 17),)
                      ],
                    ),
                    const Spacer(),
                    const Spacer()
                  ]),
                ),
              ),
            ]),
        )),
      ],),
    );
  }
}
