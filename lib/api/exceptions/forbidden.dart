import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';

/// 403 - Forbidden, exceeded limit rate.
class ForbiddenException extends PokemonTCGException {
  const ForbiddenException([String message = '']) : super(message);
}
