import 'package:elve_tcg_poke/api/exceptions/pokemon_tcg_exception.dart';

/// 404 - Not Found, requested resource not found.
class NotFoundException extends PokemonTCGException {
  const NotFoundException([String message = '']) : super(message);
}
