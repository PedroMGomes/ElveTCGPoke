part of 'cards_bloc.dart';

@immutable
abstract class CardsEvent {}

class GetCards extends CardsEvent {
  final String query;
  final int page;
  final int pageSize;
  GetCards({
    this.query = '',
    this.page = 1,
    this.pageSize = 30,
  });
}
