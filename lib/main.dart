import 'dart:convert';

import 'package:collection/collection.dart' show ListEquality;
import 'package:elve_tcg_poke/api/pokemon_tcg.client.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.settings.dart';
import 'package:elve_tcg_poke/blocs/cards/cards_bloc.dart';
import 'package:elve_tcg_poke/env/env.dart';
import 'package:elve_tcg_poke/provider/cards_provider.dart';
import 'package:elve_tcg_poke/theme/elve_theme.dart';
import 'package:elve_tcg_poke/utils/elve_logger.dart';
import 'package:elve_tcg_poke/utils/platform/platform_checker.dart';
import 'package:elve_tcg_poke/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Main entry point.
void main() {
  initialize();
  runApp(MyApp());
}

/// Initialize configurations.
void initialize() {
  final platform = PlatformChecker();
  if (platform.isAndroid()) {
    // settings status bar color on Android.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
  } else if (platform.isWeb()) {
    // initialize web specific code.
  } else if (platform.isDesktop()) {
    // initialize desktop specific code.
  }
}

/// My App.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CardsProvider>(
      create: (context) => CardsProvider(),
      builder: (context, child) => child as MaterialApp,
      child: MaterialApp(
        title: 'Elve Pokémon TCG',
        debugShowCheckedModeBanner: false,
        restorationScopeId: '__root_restore_id',
        theme: ThemeData(
          textTheme: ElveTheme.textTheme,
          primarySwatch: ElveTheme.primarySwatch,
          scaffoldBackgroundColor: ElveTheme.backgroundColor,
          appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.transparent),
        ),
        // theme: CupertinoThemeData(),
        home: Center(child: Root(title: 'Elve Pokémon TCG')),
      ),
    );
  }
}

class Root extends StatefulWidget {
  Root({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _RootState createState() => _RootState();
}

/// With [RestorationMixin].
class _RootState extends State<Root> with RestorationMixin {
  // Cards Bloc is stored and automatically restored to its previous value when the application state is restored (the app opens back up).
  final _cardsBloc = RestorableCardsBloc();

  @override
  void dispose() {
    elveLogger.close();
    _cardsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<CardsBloc>.value(
        value: _cardsBloc.value,
        child: HomeView(),
      );

  @override
  String? get restorationId => '__elve_app_id_restore';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_cardsBloc, '__cards_bloc');
  }
}

/// Custom restorable bloc.
class RestorableCardsBloc extends RestorableValue<CardsBloc> {
  /// Initialize [CardsBloc].
  @override
  CardsBloc createDefaultValue() =>
      CardsBloc(PokemonTCGClient(PokemonTCGSettings(
        apiVersion: Env.apiVersion,
        authority: Env.authority,
        apiKey: Env.apiKey,
      )))
        ..add(GetCards(page: 1, pageSize: 30));

  /// Check State update.
  @override
  void didUpdateValue(CardsBloc? oldValue) {
    if (oldValue != null) {
      final listEq = const ListEquality().equals;
      if (!listEq(oldValue.cardList, value.cardList)) {
        notifyListeners();
      } else {
        return;
      }
    }
    notifyListeners();
  }

  @override
  CardsBloc fromPrimitives(Object? data) {
    if (data == null) {
      return createDefaultValue();
    }
    return createDefaultValue()..cardList = jsonDecode(data as String);
  }

  @override
  Object? toPrimitives() {
    return jsonEncode(value.cardList);
  }
}
