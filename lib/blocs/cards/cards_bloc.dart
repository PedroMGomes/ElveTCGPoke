import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';
import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exceptions.dart';
import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.client.dart';
import 'package:elve_tcg_poke/enums/type_enum.dart';
import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:elve_tcg_poke/utils/elve_logger.dart';
import 'package:meta/meta.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  static const _max = 440;
  final PokemonTCGClient client;

  CardsBloc(this.client) : super(CardsInitial());

  /// List of page numbers that were already loaded.
  List<int> _pages = List<int>.generate(_max, (index) => index + 1);

  /// List of loaded random cards.
  List<PokeCard> _cardList = [];

  List<PokeCard> get cardList =>
      List<PokeCard>.from(_cardList, growable: false);

  set cardList(List<PokeCard> data) =>
      _cardList = List<PokeCard>.from(data, growable: true);

  /// Mapping events to state.
  @override
  Stream<CardsState> mapEventToState(
    CardsEvent event,
  ) async* {
    if (event is GetCards) {
      elveLogger.d('$runtimeType --> Page: ${event.page}');
      try {
        var nextPage = event.page;
        if (event.query.isEmpty) {
          if (event.page == 1) {
            // Shuffle button was pressed.
            yield CardsLoading();
            _pages = List<int>.generate(_max, (index) => index + 1);
            _cardList.clear();
            _cardList = [];
          }
          // Get random Page, from 0 to max exclusive.
          final randomPageIndex = Random().nextInt(_pages.length);
          nextPage = _pages[randomPageIndex];
          _pages.removeAt(randomPageIndex);
        } else {
          // Card List View - has a query.
          if (event.page == 1) {
            yield CardsLoading();
            _cardList.clear();
            _cardList = [];
          }
        }
        var query = event.query;
        if (query.isNotEmpty) {
          query = (str2PokeType(event.query) != PokeType.colorless)
              ? 'types:${event.query}'
              : 'name:${event.query}*';
        }
        final pagedResult = await client.cards.cards(
          query: query,
          page: nextPage,
          pageSize: event.pageSize,
        );
        _cardList.addAll(pagedResult.data);
        yield CardsDone(
          cardList: _cardList,
          query: event.query,
          currentPage: pagedResult.page,
          pageSize: pagedResult.pageSize,
          total: pagedResult.totalCount,
        );
      } catch (exc) {
        elveLogger.e(exc.toString());
        if (exc is PokemonTCGException) {
          yield CardsError(_cardList, exc);
        } else {
          yield CardsError(_cardList, UnknownErrorCodeException());
        }
      }
    }
  }
}
