import 'package:elve_tcg_poke/api/models/ability.dart';
import 'package:elve_tcg_poke/components/common/elve_draggable_container.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:flutter/material.dart';

/// Single Ability Widget.
class AbilityWidget extends StatelessWidget {
  const AbilityWidget({Key? key, required this.ability}) : super(key: key);

  final Ability ability;

  Widget get _divider => const SizedBox(height: 16.0);
  Widget get _smallDivider => const SizedBox(height: 4.0);

  /// build.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 6.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                ability.name,
                style: textTheme.headline5,
              ),
            ),
          ),
          _divider,
          (ability.text?.isNotEmpty ?? false)
              ? Text('Description: ',
                  style:
                      textTheme.subtitle2!.copyWith(color: ElveTheme.lightText))
              : const SizedBox(),
          _smallDivider,
          Expanded(
            child: ElveDraggableContainer(
              color: Colors.grey,
              children: [
                Text(ability.text ?? '', softWrap: true),
              ],
            ),
          ),
          _divider,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Type: ',
                style: textTheme.subtitle2!.copyWith(color: ElveTheme.darkText),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    ability.type ?? '',
                    textAlign: TextAlign.end,
                    style: textTheme.headline6,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
