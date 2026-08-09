import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class WheelPageNavigator {
  WheelPageNavigator({
    required this.controller,
    required this.pageCount,
    this.onSignalsConfirmed,
    this.threshold = 24,
    this.cooldown = const Duration(milliseconds: 550),
    this.idleReset = const Duration(milliseconds: 250),
    this.duration = const Duration(milliseconds: 450),
    this.curve = Curves.easeOutCubic,
    this.flingVelocity = 200,
  });

  final CarouselSliderController controller;
  final int pageCount;
  final VoidCallback? onSignalsConfirmed;
  final double threshold;
  final Duration cooldown;
  final Duration idleReset;

  final Duration duration;
  final Curve curve;

  final double flingVelocity;

  bool _signalsConfirmed = false;
  double _accumulated = 0;
  int _lastTurnMs = 0;
  int _lastSignalMs = 0;

  bool get signalsConfirmed => _signalsConfirmed;

  int get _nowMs => DateTime.now().millisecondsSinceEpoch;

  void handlePointerSignal(PointerSignalEvent signal, int current) {
    if (signal is! PointerScrollEvent) return;

    final now = _nowMs;
    final dy = signal.scrollDelta.dy;

    if (!_signalsConfirmed) {
      _signalsConfirmed = true;
      onSignalsConfirmed?.call();
    }

    if (now - _lastTurnMs < cooldown.inMilliseconds) {
      _accumulated = 0;
      _lastSignalMs = now;
      return;
    }

    if (dy == 0) return;

    if (now - _lastSignalMs > idleReset.inMilliseconds) _accumulated = 0;
    if (_accumulated != 0 && (_accumulated < 0) != (dy < 0)) _accumulated = 0;
    _lastSignalMs = now;

    _accumulated += dy;
    if (_accumulated.abs() < threshold) return;

    final forward = _accumulated > 0;
    _accumulated = 0;
    _scheduleTurn(forward: forward, current: current);
  }

  void handleDragEnd(DragEndDetails details, int current) {
    final velocity = details.velocity.pixelsPerSecond.dy;
    if (velocity.abs() < flingVelocity) return;
    // 손가락을 위로 밀면 다음 장.
    _scheduleTurn(forward: velocity < 0, current: current);
  }

  void _scheduleTurn({required bool forward, required int current}) {
    if (forward && current >= pageCount - 1) return;
    if (!forward && current <= 0) return;

    _lastTurnMs = _nowMs;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (forward) {
        controller.nextPage(duration: duration, curve: curve);
      } else {
        controller.previousPage(duration: duration, curve: curve);
      }
    });
    SchedulerBinding.instance.scheduleFrame();
  }

  void reset() => _accumulated = 0;
}