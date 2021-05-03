import 'package:elve_tcg_poke/api/models/attack.dart' show Attack;
import 'package:elve_tcg_poke/components/common/elve_draggable_container.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

/// Single Attack Widget.
class AttackWidget extends StatelessWidget {
  const AttackWidget({Key? key, required this.attack}) : super(key: key);

  final Attack attack;

  Widget get _divider => const SizedBox(height: 16.0);
  Widget get _smallDivider => const SizedBox(height: 8.0);

  /// build.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            attack.name,
            style: textTheme.headline5!.copyWith(color: Colors.white),
          ),
        ),
        _divider,
        Text('Cost:', style: textTheme.subtitle2),
        _smallDivider,
        Wrap(
          spacing: 4.0,
          direction: Axis.horizontal,
          children: [
            ...attack.cost
                .map((key) => Container(
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            ElveTheme.elveShadow,
                          ]),
                      child: SizedBox(
                          width: 16,
                          height: 16,
                          child: SvgPicture.asset(
                            svgIconResolver(key),
                            color: Color(typeColorResolver(key)),
                          )),
                    ))
                .toList(),
          ],
        ),
        _divider,
        (attack.text?.isNotEmpty ?? false)
            ? Text('Description:', style: textTheme.subtitle2)
            : const SizedBox(),
        _smallDivider,
        Expanded(
          child: ElveDraggableContainer(
            children: [
              Text(
                attack.text ?? '',
                softWrap: true,
                style: textTheme.bodyText2!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        _divider,
        (attack.damage?.isNotEmpty ?? false)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Damage:  ', style: textTheme.subtitle2),
                  Text(
                    attack.damage ?? '',
                    style: textTheme.headline6!.copyWith(color: Colors.white),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
