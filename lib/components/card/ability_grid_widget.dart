import 'package:elve_tcg_poke/api/models/ability.dart';
import 'package:elve_tcg_poke/components/card/ability_widget.dart';
import 'package:elve_tcg_poke/components/common/elve_grid.dart';
import 'package:elve_tcg_poke/components/common/elve_container.dart';

import 'package:flutter/material.dart';

/// Abilities Grid Widget.
class AbilityGridWidget extends StatelessWidget {
  const AbilityGridWidget({Key? key, required this.abilities})
      : super(key: key);

  final List<Ability> abilities;

  @override
  Widget build(BuildContext context) => (abilities.isEmpty)
      ? Center(
          child: Text(
            'Card has no Abilities.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      : ElveGrid(
          children: abilities
              .map(
                (ability) => ElveContainer(
                  topRightRadius: 72.0,
                  child: AbilityWidget(ability: ability),
                ),
              )
              .toList(),
        );
}
