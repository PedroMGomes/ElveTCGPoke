import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class PokeballWidget extends StatelessWidget {
  static const _assetName = 'assets/icons/pokeball.svg';

  const PokeballWidget({Key? key, this.width, this.height}) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[ElveTheme.elveShadow],
        ),
        child: SvgPicture.asset(_assetName, fit: BoxFit.cover));
  }
}
