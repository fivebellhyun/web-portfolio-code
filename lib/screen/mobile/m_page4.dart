import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taoss3932_web_site/components/app_images.dart';

class MobilePage4 extends StatelessWidget {
  const MobilePage4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(children: [
      SizedBox(height: size.height / 9,), //80
      const Text(
        "My ability.",
        style: TextStyle(fontSize: 17, color: Colors.white60),
      ),
      SizedBox(height: size.height / 71.5),
      const Text(
        "# 05",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white60),
      ),
      SizedBox(height: size.height / 71.5,), //10
      const Text(
        "100k Downloads",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      SizedBox(height: size.height / 24,), //30
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: CachedNetworkImage(
              imageUrl: AppImages.myDownload,
              fit: BoxFit.cover,
            )),
      ),
      SizedBox(height: size.height / 24,), //30
      const Text(
        "준대형 사이즈의 앱을 제작하고 3년간 운영함으로써 남다른 경험을 축적하였습니다. "
        "평점 관리, 마케팅 전략, Admob cpc 관리, 상위 노출 전략 등 다양한 전략과 방법을 통해 단기간에 성장할 수 있었습니다.",
        style: TextStyle(color: Colors.white60),
      ),
    ]);
  }
}
