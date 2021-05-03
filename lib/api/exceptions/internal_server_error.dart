import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';

/// 500 - Internal Server Error, problem with the server.
class InternalServerErrorException extends PokemonTCGException {
  const InternalServerErrorException([String message = '']) : super(message);
}
