import 'dart:convert';

import 'package:elve_tcg_poke/api/consts.dart';
import 'package:elve_tcg_poke/api/models/paged_result.dart';
import 'package:elve_tcg_poke/api/models/poke_set.dart' show PokeSet;
import 'package:elve_tcg_poke/api/pokemon_tcg.server.dart';

/// Set service.
class SetService {
  static const _endpoint = '/sets';
  final PokemonTCGServer _server;
  const SetService(this._server);

  /// Get Set by [id].
  /// Example: `GET https://api.pokemontcg.io/v2/sets/sm1`
  Future<PokeSet> cardSet(String id) async {
    final request = _server.req(endpoint: '$_endpoint/$id');
    final response = await _server.get(request);
    return PokeSet.fromJson(jsonDecode(response.body)[response_data]);
  }

  /// Get List of Sets.
  /// This call returns a maximum of `250` sets (default is `250`).
  /// [query] example: `?q=legalities.standard:legal` - Lucene like syntax.
  /// specific [page] example: `?page=2&pageSize=10`.
  /// Lucene like syntax examples:
  /// `https://docs.pokemontcg.io/#api_v2cards_get`
  /// - Exact matching.
  /// - Keyword matching.
  /// - Wildcard matching.
  /// - Range searches.
  /// - Search on nested fields.
  /// - Ordering.
  /// TODO pass a formatted String to [query] and [orderBy], according to Lucene syntax.
  Future<PagedResult<PokeSet>> cardSets({
    String query = '',
    int page = 1,
    int pageSize = 250,
    String orderBy = '',
  }) async {
    final request = _server.req(endpoint: _endpoint, queryParams: {
      'q': query,
      'page': '$page',
      'pageSize': '$pageSize',
      'orderBy': orderBy,
    });
    final response = await _server.get(request);
    return PagedResult<PokeSet>.fromJson(jsonDecode(response.body));
  }
}
