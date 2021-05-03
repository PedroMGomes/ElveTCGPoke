import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

/// Fading Logo.
class ElveCardLoadingWidget extends StatefulWidget {
  ElveCardLoadingWidget({Key? key, required this.source}) : super(key: key);

  final String source;

  @override
  _ElveCardLoadingWidgetState createState() => _ElveCardLoadingWidgetState();
}

class _ElveCardLoadingWidgetState extends State<ElveCardLoadingWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  // TODO bind all to the same animation controller.
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (contex, child) =>
          Opacity(opacity: _controller.value, child: child),
      child: SvgPicture.asset(widget.source),
    );
  }
}
