import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/screen/web/d_lastpage.dart';
import 'package:taoss3932_web_site/screen/web/d_page1.dart';
import 'package:taoss3932_web_site/screen/web/d_page2.dart';
import 'package:taoss3932_web_site/screen/web/d_page0.dart';
import 'package:taoss3932_web_site/screen/web/d_page3.dart';

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<DesktopMainPage> createState() => _MobilePastAndCommissionState();
}

class _MobilePastAndCommissionState extends State<DesktopMainPage> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  changeColor(int getcolor) {
    if (getcolor == 0) {
      return const Color(0xFFBCA5E8);
    } else if (getcolor == 1) {
      return const Color.fromARGB(255, 253, 249, 239);
    } else if (getcolor == 2) {
      return const Color.fromARGB(255, 128, 171, 188);
    } else if (getcolor == 3) {
      return const Color.fromARGB(255, 161, 158, 208);
    } else {
      return const Color.fromARGB(255, 213, 196, 196);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
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
                  onPageChanged: (index, _) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: const [
                DesktopPage0(),
                DesktopPage1(), 
                DesktopPage2(),
                DesktopPage3(), 
                DesktopLastPage()],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
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
    );
  }
}
