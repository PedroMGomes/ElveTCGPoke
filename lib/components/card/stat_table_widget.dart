import 'package:elve_tcg_poke/components/card/stat_widget.dart';
import 'package:elve_tcg_poke/components/common/elve_button.dart';
import 'package:elve_tcg_poke/components/common/elve_card_image.dart';
import 'package:elve_tcg_poke/components/common/elve_container.dart';
import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:flutter/material.dart';

/// Pokemon Card Stats Widget.
class StatsWidget extends StatelessWidget {
  const StatsWidget(this.card, {Key? key}) : super(key: key);

  final PokeCard card;

  /// Open image.
  _openImage(BuildContext context, String id, String imageUrl, Color color,
      String loadingIcon) {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent),
            backgroundColor: Colors.black,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElveCardImage(
                  backgroundLoadingColor: color,
                  imageUrl: imageUrl,
                  loadingIcon: loadingIcon,
                ),
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = card.color;
    return ElveContainer(
      topRightRadius: 72.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Table(
            children: [
              TableRow(
                children: [
                  StatWidget(
                    stat: 'HP',
                    value: card.hp ?? '',
                    color: cardColor,
                  ),
                  StatWidget(
                    stat: 'Supertype',
                    value: card.supertype ?? '',
                    color: cardColor,
                  ),
                  StatWidget(
                    stat: 'Rarity',
                    value: card.rarity ?? '',
                    color: cardColor,
                  ),
                ],
              ),
              TableRow(
                children: [
                  StatWidget(
                    stat: 'ID',
                    value: card.id,
                    color: cardColor,
                  ),
                  StatWidget(
                    stat: 'Number',
                    value: card.number,
                    color: cardColor,
                  ),
                  StatWidget(
                    stat: 'Artist',
                    value: card.artist ?? '',
                    color: cardColor,
                  )
                ],
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(card.flavorText ?? '',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: Alignment.bottomRight,
            child: ElveButton(
                color: cardColor,
                text: 'SHOW CARD',
                onTap: () => _openImage(
                      context,
                      card.id,
                      card.images.large,
                      cardColor,
                      card.icon,
                    )),
          ),
        ],
      ),
    );
  }
}
