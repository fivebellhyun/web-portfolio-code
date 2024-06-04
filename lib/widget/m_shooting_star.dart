import 'package:flutter/material.dart';

class MStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // LinearGradient로 색상 그라데이션을 정의합니다.
    const Gradient gradient = LinearGradient(
      colors: [Colors.white, Colors.transparent],
      begin: Alignment.bottomLeft, // 선의 시작과 끝을 기준으로 그라데이션 시작
      end: Alignment.topRight, // 선의 끝을 기준으로 그라데이션 종료
    );

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..shader = gradient.createShader(const Rect.fromLTRB(0, -128, 128, 0)); // 선이 그려지는 영역으로 Rect 설정

    // 경로를 생성하고 그 경로를 따라 선을 그립니다.
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(128, -128);

    canvas.drawPath(path, paint);

    // 노란색 빛 효과를 추가
    final Paint glowPaint = Paint()
      ..color = Colors.yellow
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10) // 블러의 크기와 스타일 조정
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1; // 빛의 너비

    canvas.drawPath(path, glowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}