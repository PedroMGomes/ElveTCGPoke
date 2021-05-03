import 'package:elve_tcg_poke/api/models/resistance.dart' show Resistance;
import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:flutter/material.dart';

/// Even though this widget is the same as [WeaknessWidget], [Resistance] has its own widget due to future API changes.
class ResistanceWidget extends StatelessWidget {
  const ResistanceWidget({Key? key, required this.resistance})
      : super(key: key);

  final Resistance resistance;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var text = pokeType2str(resistance.type);
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
            Text('Value:  ', style: textTheme.subtitle2),
            Text(
              resistance.value,
              style: textTheme.headline6!.copyWith(color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
