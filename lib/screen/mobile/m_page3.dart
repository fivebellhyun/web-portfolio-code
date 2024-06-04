import 'package:flutter/material.dart';

class MobilePage3 extends StatelessWidget {
  const MobilePage3({
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
      SizedBox(height: size.height / 14.3,), //50
      const Text(
        "# 04",
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
            child: Image.asset(
              "repo/my_download.jpg",
              fit: BoxFit.cover,
            )),
      ),
      SizedBox(height: size.height / 24,), //30
      const Text(
        "준대형 사이즈의 앱을 제작하고 3년간 운영함으로써 남다른 경험을 축적하였습니다. "
        " 어쩌고 저쩌고 내용 추가 필요",
        style: TextStyle(color: Colors.white60),
      ),
    ]);
  }
}
