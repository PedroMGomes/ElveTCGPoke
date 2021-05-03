abstract class PokemonTCGException implements Exception {
  final String message;
  const PokemonTCGException([this.message = '']);
}
