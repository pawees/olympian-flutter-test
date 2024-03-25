import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/hint_model.dart';
import '../utils/play_animation_mixin.dart';
import '../viewmodels/hints_viewmodel.dart';


class HelperLottieAnimation extends StatefulWidget {
  final String animationKey;
  final String animationPath;
  final Alignment animationAlignment;
  final Widget child;

  const HelperLottieAnimation(
      {required this.child,
      required this.animationAlignment,
      required this.animationKey,
      required this.animationPath,
      Key? key})
      : super(key: key);

  @override
  State<HelperLottieAnimation> createState() => _HelperLottieAnimationState();
}

class _HelperLottieAnimationState extends State<HelperLottieAnimation>
    with SingleTickerProviderStateMixin, PlayAnimationMixin {
  late HintState? state;

  @override
  void initState() {
    super.initState();
    state = Provider.of<HintsViewModel>(context, listen: false)
        .hints[widget.animationKey]
        ?.state;
    if (state == HintState.visible) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        cycleAnimation(const Duration(milliseconds: 1100));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Selector<HintsViewModel, HintModel?>(
      selector: (_, store) => store.hints[widget.animationKey],
      builder: (_, animationState, __) {
        if (animationState == null) {
          return widget.child;
        }

        if (animationState.state == HintState.visible) {
          return Stack(
            alignment: widget.animationAlignment,
            children: [
              widget.child,
              Lottie.asset(
                widget.animationPath,
                fit: BoxFit.cover,
                animate: true,
                controller: animationController,
              ),
            ],
          );
        } else {
          return widget.child;
        }
      },
    );
  }
}
