import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/screen/mobile/m_lastpage.dart';
import 'package:taoss3932_web_site/screen/mobile/m_page1.dart';
import 'package:taoss3932_web_site/screen/mobile/m_page2.dart';
import 'package:taoss3932_web_site/screen/mobile/m_page3.dart';
import 'package:taoss3932_web_site/screen/mobile/m_page0.dart';
import 'package:taoss3932_web_site/screen/mobile/m_page4.dart';
import 'package:taoss3932_web_site/tools/wheel_page_navigator.dart';

class MobileMainPage extends StatefulWidget {
  const MobileMainPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<MobileMainPage> createState() => _MobileMainPageState();
}

class _MobileMainPageState extends State<MobileMainPage> {
  static const List<Widget> _pages = [
    MobilePage0(),
    MobilePage1(),
    MobilePage2(),
    MobilePage3(),
    MobilePage4(),
    MobileLastPage(),
  ];

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  bool _driveManually = false;

  late final WheelPageNavigator _navigator = WheelPageNavigator(
    controller: _carouselController,
    pageCount: _pages.length,
    onSignalsConfirmed: () {
      if (mounted) setState(() => _driveManually = true);
    },
    // 터치가 감지되면 네이티브 물리로 되돌린다.
    // 손가락 추종은 네이티브 물리로만 구현되기 때문이다.
    onNativeRestore: () {
      if (mounted) setState(() => _driveManually = false);
    },
    debugWheel: false,
  );

  int _current = 0;

  Color changeColor(int getcolor) {
    if (getcolor == 0) {
      return const Color(0xFF080B14);
    } else if (getcolor == 1) {
      return const Color.fromARGB(255, 253, 249, 239);
    } else if (getcolor == 2) {
      return const Color.fromARGB(255, 219, 237, 219);
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
      onPointerSignal: (signal) =>
          _navigator.handlePointerSignal(signal, _current),
      onPointerDown: _navigator.handlePointerDown,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: changeColor(_current),
        child: Row(
          children: [
            const SizedBox(width: 26),
            Expanded(
              child: GestureDetector(
                onVerticalDragEnd: (details) =>
                    _navigator.handleDragEnd(details, _current),
                child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: size.height,
                    viewportFraction: 1,
                    scrollDirection: Axis.vertical,
                    enableInfiniteScroll: false,
                    scrollPhysics:
                        _driveManually ? const NeverScrollableScrollPhysics() : null,
                    onPageChanged: (index, _) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  items: _pages,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) {
                final selected = _current == index;
                final opacity = selected ? 0.9 : 0.4;
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(index),
                  child: Container(
                    width: selected ? 10 : 5,
                    height: selected ? 10 : 5,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // 0번 페이지만 배경이 어두워서 점 색을 반전한다.
                      color: _current != 0
                          ? Colors.black.withOpacity(opacity)
                          : Colors.white.withOpacity(opacity),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}