import 'package:flutter/material.dart';

class DesktopPage3 extends StatelessWidget {
  const DesktopPage3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "My ability.",
            style: TextStyle(fontSize: 17, color: Colors.black54),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "# 04",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "100k Downloads",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                child: Image.asset(
                  "repo/my_download.jpg",
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 80,
          )
        ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 55,
            ),
            SizedBox(
              width: size.width - 1000,
              child: const Text(
                "준대형 사이즈의 앱을 제작하고 3년간 운영함으로써 남다른 경험을 축적하였습니다. "
                " 어쩌고 저쩌고 내용 추가 필요",
                style: TextStyle(color: Colors.black54, fontSize: 17),
              ),
            ),
            const Spacer(
              flex: 45,
            )
          ],
        ),
      ],
    );
  }
}
