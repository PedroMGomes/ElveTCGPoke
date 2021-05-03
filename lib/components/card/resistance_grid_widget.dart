import 'package:elve_tcg_poke/api/models/resistance.dart';
import 'package:elve_tcg_poke/components/card/resistance_widget.dart';
import 'package:elve_tcg_poke/components/common/elve_grid.dart';
import 'package:elve_tcg_poke/components/common/elve_stacked_container.dart';
import 'package:flutter/material.dart';

class ResistanceGridWidget extends StatelessWidget {
  const ResistanceGridWidget({Key? key, required this.resistances})
      : super(key: key);

  final List<Resistance> resistances;

  @override
  Widget build(BuildContext context) => (resistances.isEmpty)
      ? Center(
          child: Text('Card has no Resistances.',
              style: Theme.of(context).textTheme.bodyText1),
        )
      : ElveGrid(
          childAspectRatio: 0.9,
          children: resistances
              .map((resistance) => ElveStackedContainer(
                  topRightRadius: 72.0,
                  image: resistance.icon,
                  color: resistance.color,
                  child: ResistanceWidget(resistance: resistance)))
              .toList(),
        );
}
