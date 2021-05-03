import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';

/// 503 - Service Unavailable, temporarily offline for maintenance.
class ServiceUnavailableException extends PokemonTCGException {
  const ServiceUnavailableException([String message = '']) : super(message);
}
