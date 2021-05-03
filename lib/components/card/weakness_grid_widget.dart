import 'package:elve_tcg_poke/api/models/weakness.dart';
import 'package:elve_tcg_poke/components/card/weakness_widget.dart';
import 'package:elve_tcg_poke/components/common/elve_grid.dart';
import 'package:elve_tcg_poke/components/common/elve_stacked_container.dart';
import 'package:flutter/material.dart';

/// Weaknesses Widget.
class WeaknessGridWidget extends StatelessWidget {
  const WeaknessGridWidget({Key? key, required this.weaknesses})
      : super(key: key);

  final List<Weakness> weaknesses;

  @override
  Widget build(BuildContext context) => (weaknesses.isEmpty)
      ? Center(
          child: Text('Card has no Weaknesses.',
              style: Theme.of(context).textTheme.bodyText1),
        )
      : ElveGrid(
          childAspectRatio: 0.9,
          children: weaknesses
              .map((weakness) => ElveStackedContainer(
                  topRightRadius: 72,
                  image: weakness.icon,
                  color: weakness.color,
                  child: WeaknessWidget(weakness: weakness)))
              .toList(),
        );
}
