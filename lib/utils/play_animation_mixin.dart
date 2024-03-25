import 'package:flutter/material.dart';

mixin PlayAnimationMixin<T extends StatefulWidget>
    on SingleTickerProviderStateMixin<T> {
  late AnimationController animationController;
  final Duration _animationDuration = Duration(milliseconds: 3000);

  Duration get duration => _animationDuration;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
  }

  void setDuration([Duration? duration]) {
    if (duration != null) {
      animationController.duration = duration;
    }
  }

  Future<void> playAnimation([Duration? duration]) async {
    if (duration != null) {
      animationController.duration = duration;
    }
    animationController.isCompleted
        ? animationController.reverse()
        : animationController.forward();
  }

  Future<void> cycleAnimation([Duration? duration]) async {
    if (duration != null) {
      animationController.duration = duration;
    }
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
