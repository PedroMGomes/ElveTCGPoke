import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:flutter/material.dart';

class ElveContainer extends StatelessWidget {
  const ElveContainer({
    Key? key,
    required this.child,
    this.color = Colors.white,
    this.topRightRadius = 64.0,
  }) : super(key: key);

  final Widget child;
  final double topRightRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ElveTheme.lighterShade(color),
            ElveTheme.darkerShade(color),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(8.0),
          bottomLeft: const Radius.circular(8.0),
          bottomRight: const Radius.circular(8.0),
          topRight: Radius.circular(topRightRadius),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: (color == Colors.white)
                ? ElveTheme.shadowColor.withOpacity(0.4)
                : color,
            offset: const Offset(1.0, 4.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
