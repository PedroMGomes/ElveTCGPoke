import 'package:elve_tcg_poke/enums/type_enum.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';

import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Widget to display the pokemon types.
class TypesWrapWidget extends StatelessWidget {
  const TypesWrapWidget({Key? key, required this.types}) : super(key: key);

  final List<PokeType> types;

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: types
            .map((type) => Chip(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  backgroundColor: Color(typeColorResolver(type)),
                  shadowColor:
                      ElveTheme.lighterShade(Color(typeColorResolver(type))),
                  avatar: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SvgPicture.asset(svgIconResolver(type))),
                  label: Text(
                    pokeType2str(type),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white),
                  ),
                ))
            .toList(),
      );
}
