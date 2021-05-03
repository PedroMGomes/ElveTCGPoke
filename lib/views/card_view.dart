import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:elve_tcg_poke/components/card/ability_grid_widget.dart';
import 'package:elve_tcg_poke/components/card/attack_grid_widget.dart';
import 'package:elve_tcg_poke/components/card/resistance_grid_widget.dart';
import 'package:elve_tcg_poke/components/card/stat_table_widget.dart';
import 'package:elve_tcg_poke/components/card/types_wrap_widget.dart';
import 'package:elve_tcg_poke/components/card/weakness_grid_widget.dart';
import 'package:elve_tcg_poke/components/common/elve_card_app_bar.dart';
import 'package:elve_tcg_poke/components/common/pokeball_widget.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Card View.
class CardView extends StatefulWidget {
  const CardView({Key? key, required this.card}) : super(key: key);

  final PokeCard card;

  @override
  _CardViewState createState() => _CardViewState();
}

/// Card View State.
class _CardViewState extends State<CardView> with TickerProviderStateMixin {
  // late final AnimationController animationController;
  // late final Animation<double> animation;
  final appbarOpacityNotifier = ValueNotifier<double>(0.0);
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >= 32) {
        if (appbarOpacityNotifier.value != 1.0) {
          appbarOpacityNotifier.value = 1.0;
        }
      } else if (scrollController.offset <= 32 &&
          scrollController.offset >= 0) {
        if (appbarOpacityNotifier.value != scrollController.offset / 32) {
          appbarOpacityNotifier.value = scrollController.offset / 32;
        }
      } else if (scrollController.offset <= 0) {
        if (appbarOpacityNotifier.value != 0.0) {
          appbarOpacityNotifier.value = 0.0;
        }
      }
    });
  }

  /// build.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: ElveTheme.gridMaxWidth),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  controller: scrollController,
                  children: [
                    SizedBox(height: AppBar().preferredSize.height),
                    TypesWrapWidget(types: widget.card.types),
                    _SectionHeader('Stats'),
                    StatsWidget(widget.card),
                    _SectionHeader('Attacks'),
                    AttackGridWidget(attacks: widget.card.attacks ?? []),
                    _SectionHeader('Weaknesses'),
                    WeaknessGridWidget(
                        weaknesses: widget.card.weaknesses ?? []),
                    _SectionHeader('Resistances'),
                    ResistanceGridWidget(
                        resistances: widget.card.resistances ?? []),
                    _SectionHeader('Abilities'),
                    AbilityGridWidget(abilities: widget.card.abilities ?? []),
                    SizedBox(height: 100)
                  ],
                ),
                ValueListenableBuilder<double>(
                  valueListenable: appbarOpacityNotifier,
                  builder: (context, double value, child) => ElveCardAppBar(
                    opacity: value,
                    text: widget.card.name,
                    color: widget.card.color,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Title widget.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(top: 32.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PokeballWidget(
            width: 18.0,
            height: 18.0,
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              endIndent: 16.0,
              indent: 16.0,
            ),
          ),
          Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.grey.shade600, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
