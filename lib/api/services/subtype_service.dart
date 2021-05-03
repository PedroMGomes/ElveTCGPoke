import 'dart:convert';

import 'package:elve_tcg_poke/api/consts.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.server.dart';

/// Subtype service.
class SubtypeService {
  static const _endpoint = '/subtypes';
  final PokemonTCGServer _server;
  const SubtypeService(this._server);

  /// Get Subtype `String` List.
  /// Example: `GET https://api.pokemontcg.io/v2/subtypes`
  Future<List<String>> subtypes() async {
    final request = _server.req(endpoint: _endpoint);
    final response = await _server.get(request);
    return (jsonDecode(response.body)[response_data] as List<dynamic>)
        .map((value) => value.toString())
        .toList();
  }
}
