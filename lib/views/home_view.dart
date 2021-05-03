import 'package:elve_tcg_poke/blocs/cards/cards_bloc.dart';
import 'package:elve_tcg_poke/components/common/elve_button.dart';
import 'package:elve_tcg_poke/components/common/elve_drawer.dart';
import 'package:elve_tcg_poke/components/consumers/card_bloc_consumer.dart';
import 'package:elve_tcg_poke/components/home/card_grid_widget.dart';
import 'package:elve_tcg_poke/components/home/suggestions_widget.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _textController = TextEditingController();
  final _controller = FloatingSearchBarController();

  /// Perform Search with user typed [query].
  void _performSearch(BuildContext context, String query) {
    query = query.trim();
    if (query.isNotEmpty && query.length > 2) {
      context.read<CardsBloc>().add(GetCards(
            query: query.toLowerCase(),
            page: 1,
          ));
    }
    // close the material floating search bar widget.
    this._controller.close();
  }

  void _shuffle(BuildContext context) =>
      context.read<CardsBloc>().add(GetCards());

  @override
  void dispose() {
    _textController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ElveDrawer(
        currentIndex: DrawerIndex.home,
        onTap: (DrawerIndex index) {
          if (index != DrawerIndex.home) {
            Navigator.of(context).pop();
            // pop the drawer.
          }
        },
      ),
      floatingActionButton: ElveButton(
        text: 'SHUFFLE',
        color: ElveTheme.lightText,
        onTap: () => _shuffle(context),
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: ElveTheme.gridMaxWidth),
          child: FloatingSearchBar(
            elevation: 4.0,
            hint: 'Search...',
            autocorrect: true,
            shadowColor: ElveTheme.shadowColor,
            border: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0),
            iconColor: Theme.of(context).primaryColor,
            controller: this._controller,
            closeOnBackdropTap: true,
            clearQueryOnClose: true,
            // progress: false,
            scrollPadding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
            transitionDuration: const Duration(milliseconds: 512),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            borderRadius: BorderRadius.circular(4.0),
            axisAlignment: 0.0, // center align.
            openAxisAlignment: 0.0, // center align.
            width: double.infinity,
            isScrollControlled: true,
            onSubmitted: (String query) => _performSearch(context, query),
            debounceDelay: const Duration(milliseconds: 512),
            onQueryChanged: (String query) {},
            body: CardsBlocConsumer(
              builder: (context, cardList) => CardGridWidget(
                key: ValueKey('__grid_card_list'),
                cardList: cardList,
              ),
            ),
            builder: (context, Animation<double> transition) => FadeTransition(
              opacity: transition,
              child: SuggestionsWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
