import 'dart:convert';

import 'package:elve_tcg_poke/api/consts.dart';
import 'package:elve_tcg_poke/api/models/paged_result.dart';
import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:elve_tcg_poke/api/pokemon_tcg.server.dart';

/// `/cards`.
class CardService {
  static const _endpoint = '/cards';
  final PokemonTCGServer _server;
  const CardService(this._server);

  /// Get Card by [id].
  /// Example: `GET https://api.pokemontcg.io/v2/cards/xy7-54`
  Future<PokeCard> card(String id) async {
    final request = _server.req(endpoint: '$_endpoint/$id');
    final response = await _server.get(request);
    return PokeCard.fromJson(jsonDecode(response.body)[response_data]);
  }

  /// Get List of Cards.
  /// This call returns a maximum of `250` cards (default is `250`).
  /// [query] example: `?q=supertype:pokemon types:dragon` - Lucene like syntax.
  /// specific [page] example: `?page=5`.
  /// Lucene like syntax examples:
  /// `https://docs.pokemontcg.io/#api_v2cards_get`
  /// - Exact matching.
  /// - Keyword matching.
  /// - Wildcard matching.
  /// - Range searches.
  /// - Search on nested fields.
  /// - Ordering.
  /// TODO pass a formatted String to [query] and [orderBy], according to Lucene syntax.
  Future<PagedResult<PokeCard>> cards({
    String query = '',
    int pageSize = 30,
    int page = 1,
    // String orderBy = '',
  }) async {
    final queryParams = {'page': '$page', 'pageSize': '$pageSize'};
    if (query.isNotEmpty) queryParams['q'] = query;
    final request = _server.req(endpoint: _endpoint, queryParams: queryParams);
    final response = await _server.get(request);
    return PagedResult<PokeCard>.fromJson(jsonDecode(response.body));
  }
}
