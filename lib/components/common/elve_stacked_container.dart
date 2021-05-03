import 'package:elve_tcg_poke/components/common/elve_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

/// Used used for Pokemon card characteristic.
class ElveStackedContainer extends StatelessWidget {
  const ElveStackedContainer({
    Key? key,
    required this.child,
    required this.image,
    this.extTopPadding = 24.0,
    this.intTopPadding = 32.0,
    this.topRightRadius = 72.0,
    this.color = Colors.white,
  }) : super(key: key);

  /// Card content.
  final Widget child;

  /// Top left corner icon.
  final String image;

  /// External padding.
  final double extTopPadding;

  /// Internal top padding.
  final double intTopPadding;

  /// Top right corner radius.
  final double topRightRadius;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Padding(
          padding: EdgeInsets.only(top: extTopPadding),
          child: ElveContainer(
            topRightRadius: topRightRadius,
            color: color,
            child: Padding(
              padding: EdgeInsets.only(top: intTopPadding),
              child: child,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 2,
          child: SizedBox(
            width: 60,
            height: 60,
            child: SvgPicture.asset(
              image,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
