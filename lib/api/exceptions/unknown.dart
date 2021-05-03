import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';

/// Unknown Response Error Code.
class UnknownErrorCodeException extends PokemonTCGException {
  const UnknownErrorCodeException([String message = '']) : super(message);
}
