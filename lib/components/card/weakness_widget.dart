import 'package:elve_tcg_poke/api/models/weakness.dart';
import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:flutter/material.dart';

/// Even though this widget is the same as [ResistanceWidget], [Weakness] has its own widget due to future API changes.
class WeaknessWidget extends StatelessWidget {
  const WeaknessWidget({Key? key, required this.weakness}) : super(key: key);

  final Weakness weakness;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var text = pokeType2str(weakness.type);
    text = text[0].toUpperCase() + text.substring(1, text.length);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: textTheme.headline5!.copyWith(color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Value:  ',
              style: textTheme.subtitle2,
            ),
            Text(
              weakness.value,
              style: textTheme.headline6!.copyWith(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
