part of 'cards_bloc.dart';

@immutable
abstract class CardsState {}

/// Initial State.
class CardsInitial extends CardsState {}

/// Loading State.
class CardsLoading extends CardsState {}

/// Success State.
class CardsDone extends CardsState {
  /// Current searched query.
  final String query;

  /// Current set of loaded cards.
  final List<PokeCard> cardList;
  final int currentPage;
  final int pageSize;
  // final int count;

  /// Total results for [query].
  final int total;

  CardsDone({
    required this.query,
    required this.cardList,
    required this.currentPage,
    required this.pageSize,
    required this.total,
  });
}

/// Error State.
class CardsError extends CardsState {
  final List<PokeCard> cardList;
  final PokemonTCGException exception;
  CardsError(this.cardList, this.exception);
}
