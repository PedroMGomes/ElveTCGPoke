import 'dart:convert';

import 'package:elve_tcg_poke/api/consts.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.server.dart';

/// Supertype service.
class SupertypeService {
  static const _endpoint = '/supertypes';
  final PokemonTCGServer _server;
  const SupertypeService(this._server);

  /// Get Supertype `String` List.
  /// Example: `GET https://api.pokemontcg.io/v2/supertypes`
  Future<List<String>> supertypes() async {
    final request = _server.req(endpoint: _endpoint);
    final response = await _server.get(request);
    return (jsonDecode(response.body)[response_data] as List<dynamic>)
        .map((value) => value.toString())
        .toList();
  }
}
