import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/screen/web/d_lastpage.dart';
import 'package:taoss3932_web_site/screen/web/d_page1.dart';
import 'package:taoss3932_web_site/screen/web/d_page2.dart';
import 'package:taoss3932_web_site/screen/web/d_page3.dart';
import 'package:taoss3932_web_site/screen/web/d_page0.dart';
import 'package:taoss3932_web_site/screen/web/d_page4.dart';

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<DesktopMainPage> createState() => _MobilePastAndCommissionState();
}

class _MobilePastAndCommissionState extends State<DesktopMainPage> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _current = 0;
  bool moveWithMouse = false;

  changeColor(int getcolor) {
    if (getcolor == 0) {
      return const Color(0xFF080B14);
    } else if(getcolor == 1) {
      return const Color.fromARGB(255, 253, 249, 239);
    } else if (getcolor == 2) {
      return const Color.fromARGB(255, 201, 225, 219);
    } else if (getcolor == 3) {
      return const Color.fromARGB(255, 190, 237, 255);
    } else if (getcolor == 4) {
      return const Color.fromARGB(255, 161, 158, 208);
    } else {
      return const Color.fromARGB(255, 213, 196, 196);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Listener(
      onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
          final dy = pointerSignal.scrollDelta.dy;

          if (dy.abs() % 1 == 0) {
            //트랙패드
            setState(() {
              moveWithMouse = false;
            });
          } else {
            //마우스
            setState(() {
              moveWithMouse = true;
            });
            if(pointerSignal.scrollDelta.dy >= 0) {
              if (_current < 5) {
                _carouselController.nextPage();
              }
            } else if (pointerSignal.scrollDelta.dy < 0) {
              // 위로 스크롤
              if (_current > 0) {
                _carouselController.previousPage();
              }
            }
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: changeColor(_current),
        child: Row(
          children: [
            const SizedBox(width: 26),
            Expanded(
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: size.height,
                  viewportFraction: 1,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  scrollPhysics: moveWithMouse ? const NeverScrollableScrollPhysics() : null,
                  onPageChanged: (index, _) {
                    setState(() {
                      _current = index;
                    });
                  }
                ),
                items: const [
                  DesktopPage0(),
                  DesktopPage1(), 
                  DesktopPage2(),
                  DesktopPage3(), 
                  DesktopPage4(), 
                  DesktopLastPage()
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2, 3, 4, 5, 6].asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: _current == entry.key ? 10 : 5,
                    height: _current == entry.key ? 10 : 5,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black.withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
