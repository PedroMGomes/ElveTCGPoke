import 'dart:math';

import 'package:elve_tcg_poke/components/common/pokeball_widget.dart';
import 'package:flutter/material.dart';

/// Loading Spinner widget.
class ElveLoadingWidget extends StatefulWidget {
  const ElveLoadingWidget({Key? key}) : super(key: key);

  @override
  _ElveLoadingWidgetState createState() => _ElveLoadingWidgetState();
}

class _ElveLoadingWidgetState extends State<ElveLoadingWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            child: PokeballWidget(
              height: 56.0,
              width: 56.0,
            )),
        const SizedBox(height: 32.0),
        Text(
          'Loading',
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
