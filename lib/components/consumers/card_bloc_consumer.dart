import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:elve_tcg_poke/blocs/cards/cards_bloc.dart';
import 'package:elve_tcg_poke/components/common/elve_error_widget.dart';
import 'package:elve_tcg_poke/components/common/elve_loading_widget.dart';
import 'package:elve_tcg_poke/provider/cards_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef CardsBlocBuilder = Widget Function(
  BuildContext context,
  List<PokeCard> event,
);

class CardsBlocConsumer extends StatelessWidget {
  const CardsBlocConsumer({Key? key, required this.builder}) : super(key: key);

  final CardsBlocBuilder builder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardsBloc, CardsState>(
      listener: (context, event) {
        if (event is CardsDone) {
          context.read<CardsProvider>()
            ..query = event.query
            ..currentPage = event.currentPage
            ..total = event.total
            ..pageSize = event.pageSize
            ..currentTotal = event.cardList.length;
        }
      },
      builder: (context, event) {
        if (event is CardsDone) {
          return builder(context, event.cardList);
        } else if (event is CardsLoading) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElveLoadingWidget(),
            ),
          );
        } else if (event is CardsError) {
          return (event.cardList.isEmpty)
              ? ElveErrorWidget()
              : builder(context, event.cardList);
        }
        return SizedBox();
      },
    );
  }
}
