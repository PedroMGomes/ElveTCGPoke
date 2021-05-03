import 'package:elve_tcg_poke/api/models/attack.dart';
import 'package:elve_tcg_poke/components/card/attack_widget.dart';
import 'package:elve_tcg_poke/components/common/elve_grid.dart';
import 'package:elve_tcg_poke/components/common/elve_stacked_container.dart';
import 'package:flutter/material.dart';

/// Pokemon Attacks grid widget.
class AttackGridWidget extends StatelessWidget {
  const AttackGridWidget({Key? key, required this.attacks}) : super(key: key);

  final List<Attack> attacks;

  /// build.
  @override
  Widget build(BuildContext context) => (attacks.isEmpty)
      ? Center(
          child: Text('Card has no Attacks.',
              style: Theme.of(context).textTheme.bodyText1),
        )
      : ElveGrid(
          children: attacks
              .map((attack) => ElveStackedContainer(
                  image: attack.icon,
                  color: attack.color,
                  child: AttackWidget(attack: attack)))
              .toList(),
        );
}
