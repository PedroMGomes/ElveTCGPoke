import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:elve_tcg_poke/blocs/cards/cards_bloc.dart';
import 'package:elve_tcg_poke/components/common/elve_card_image.dart';
import 'package:elve_tcg_poke/provider/cards_provider.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:elve_tcg_poke/views/card_view.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Card Grid View.
class CardGridWidget extends StatefulWidget {
  CardGridWidget({Key? key, required this.cardList}) : super(key: key);

  final List<PokeCard> cardList;
  @override
  _CardGridWidgetState createState() => _CardGridWidgetState();
}

/// Card Grid View state.
class _CardGridWidgetState extends State<CardGridWidget> {
  // aspect ratio based on card images actual dimensions.
  static const _itemAspectRatio = 0.7165;
  static const _extentThreshold = 512.0;

  late final ScrollController _scrollController;

  bool _lock = false;

  @override
  void initState() {
    super.initState();
    // Infinite Scrolling.
    _scrollController = ScrollController()
      ..addListener(() {
        // N pixels to offset ListView children on the opposite direction.
        final currentPos = this._scrollController.position.pixels;
        // Maximum in-range value for pixels.
        final maxExtent = this._scrollController.position.maxScrollExtent;
        /* && _lastMaxExtend != maxExtent */
        if (currentPos >= (maxExtent - _extentThreshold) && !_lock) {
          _lock = true;
          Future.delayed(const Duration(seconds: 2), () => _lock = false);
          _appendNewCards(context);
        }
      });
  }

  /// Append new cards for the same query.
  void _appendNewCards(BuildContext context) {
    final provider = context.read<CardsProvider>();
    // Make new request if there are cards left to load.
    if (provider.currentTotal < provider.total) {
      context.read<CardsBloc>().add(GetCards(
            query: provider.query,
            page: provider.currentPage + 1,
            pageSize: provider.pageSize,
          ));
    }
  }

  /// Open Card View.
  void _openCard(BuildContext context, PokeCard card) => Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => CardView(card: card)));

  @override
  void dispose() {
    this._scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(
          vertical: AppBar().preferredSize.height + 32,
          horizontal: 4.0,
        ),
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: widget.cardList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ElveTheme.getGridCrossAxisCount(constraints.maxWidth),
          childAspectRatio: _itemAspectRatio,
        ),
        itemBuilder: (context, index) {
          final card = widget.cardList.elementAt(index);
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () => _openCard(context, card),
              child: ElveCardImage(
                key: ValueKey('__${card.id}'),
                imageUrl: card.images.small,
                loadingIcon: card.icon,
                backgroundLoadingColor: card.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
