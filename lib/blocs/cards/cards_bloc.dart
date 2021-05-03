import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';
import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exceptions.dart';
import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.client.dart';
import 'package:elve_tcg_poke/utils/elve_logger.dart';
import 'package:meta/meta.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final PokemonTCGClient client;

  CardsBloc(this.client) : super(CardsInitial());

  /// List of loaded cards.
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
        if (event.page == 1) {
          _cardList = [];
          // Only yields Loading event if a new search is made.
          yield CardsLoading();
        }
        final pagedResult = await client.cards.cards(
          pageSize: event.pageSize,
          page: event.page,
          query: event.query,
        );
        _cardList.addAll(pagedResult.data);
        yield CardsDone(
          query: event.query,
          cardList: _cardList,
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
