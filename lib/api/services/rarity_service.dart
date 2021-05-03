import 'dart:convert';

import 'package:elve_tcg_poke/api/consts.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.server.dart';

/// Rarity service.
class RarityService {
  static const _endpoint = '/rarities';
  final PokemonTCGServer _server;
  const RarityService(this._server);

  /// Get Rarity `String` List.
  /// Example: `GET https://api.pokemontcg.io/v2/rarities`
  Future<List<String>> rarities() async {
    final request = _server.req(endpoint: _endpoint);
    final response = await _server.get(request);
    return (jsonDecode(response.body)[response_data] as List<dynamic>)
        .map((value) => value.toString())
        .toList();
  }
}
