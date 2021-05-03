import 'dart:convert';

import 'package:elve_tcg_poke/api/consts.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.server.dart';

/// Type service.
class TypeService {
  static const _endpoint = '/types';
  final PokemonTCGServer _server;
  const TypeService(this._server);

  /// Get Types `String` List.
  /// Example: `GET https://api.pokemontcg.io/v2/types`
  Future<List<String>> types() async {
    final request = _server.req(endpoint: _endpoint);
    final response = await _server.get(request);
    return (jsonDecode(response.body)[response_data] as List<dynamic>)
        .map((value) => value.toString())
        .toList();
  }
}
