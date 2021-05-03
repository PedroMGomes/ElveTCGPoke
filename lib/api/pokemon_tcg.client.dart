import 'package:elve_tcg_poke/api/pokemon_tcg.server.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.settings.dart';
import 'package:elve_tcg_poke/api/services/card_service.dart';
import 'package:elve_tcg_poke/api/services/rarity_service.dart';
import 'package:elve_tcg_poke/api/services/set_service.dart';
import 'package:elve_tcg_poke/api/services/subtype_service.dart';
import 'package:elve_tcg_poke/api/services/supertype_service.dart';
import 'package:elve_tcg_poke/api/services/type_service.dart';

class PokemonTCGClient {
  final PokemonTCGServer _server;

  /// inits server.
  PokemonTCGClient(PokemonTCGSettings settings)
      : _server = PokemonTCGServer(
          apiKey: settings.apiKey,
          apiVersion: settings.apiVersion,
          authority: settings.authority,
        );

  /// Available services.
  SetService get sets => SetService(_server);
  CardService get cards => CardService(_server);
  TypeService get types => TypeService(_server);
  RarityService get rarities => RarityService(_server);
  SubtypeService get subtypes => SubtypeService(_server);
  SupertypeService get supertypes => SupertypeService(_server);
}
