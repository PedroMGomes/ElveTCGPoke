import 'package:elve_tcg_poke/api/exceptions/forbidden.dart';
import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exceptions.dart';
import 'package:elve_tcg_poke/utils/elve_logger.dart';
import 'package:http/http.dart' as http;

/// Class to access `http` package.
/// Endpoint request example: `https://api.pokemontcg.io/<version>/<resource>`.
/// Even though it is not required, the official docs recomend the usage of an API key. The API key should be appended through the `X-Api-Key` header to every request. Using an API key provides access to better rate limits.
/// By default requests are limited to `20k/day` with API key and `1k/day` with a max of `30/minute` without.
/// All endpoints that return data have their data in the `data` field.
class PokemonTCGServer {
  /// `https://api.pokemontcg.io`.
  final String authority;

  final String apiKey;

  /// example: `v2`.
  final String apiVersion;

  const PokemonTCGServer({
    required this.authority,
    required this.apiKey,
    required this.apiVersion,
  });

  bool get hasKey => apiKey.isNotEmpty;

  /// API error resolver.
  /// Throws Exceptions accordingly.
  void _pokemonApiErrorResolver(http.Response response) {
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(response.body);
      case 403:
        throw ForbiddenException(response.body);
      case 404:
        throw NotFoundException(response.body);
      case 500:
        throw InternalServerErrorException(response.body);
      case 503:
        throw ServiceUnavailableException(response.body);
      default:
        break;
      // throw UnknownErrorCodeException(response.body);
    }
  }

  /// Default API Headers.
  Map<String, String> get _defaultHeaders =>
      {'Content-Type': 'application/json'};

  /// Auth API Headers.
  Map<String, String> get _authHeaders => {'X-Api-Key': apiKey};

  /// Wrapper around [Uri.https].
  /// Adds the authority, path(version + endpoint/service) and query params (from `Map` to `String`).
  /// [endpoint] is provided by each service and is prefixed by `/`.
  Uri req({String endpoint = '', Map<String, String> queryParams = const {}}) =>
      Uri.https(authority, '$apiVersion$endpoint', queryParams);

  /// Wrapper over `http.get` that adds *required* default headers.
  /// Resolves errors with proper exceptions and `throws`.
  /// Not every `GET` method requires client auth.
  Future<http.Response> get(Uri request, {bool authRequired = true}) async {
    elveLogger.d('${request.path}?${request.query}');
    final headers = _defaultHeaders;
    if (hasKey) headers.addAll(_authHeaders);
    final response = await http.get(request, headers: headers);
    _pokemonApiErrorResolver(response);
    return response;
  }
}
