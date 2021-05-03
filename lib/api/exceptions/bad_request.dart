import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';

/// 400 - Bad Request.
class BadRequestException extends PokemonTCGException {
  const BadRequestException([String message = '']) : super(message);
}
