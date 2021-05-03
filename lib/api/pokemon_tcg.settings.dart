import 'package:yaml/yaml.dart';

class PokemonTCGSettings {
  /// `https://api.pokemontcg.io`.
  final String authority;

  final String apiKey;

  /// example: `v2`.
  final String apiVersion;

  const PokemonTCGSettings({
    this.authority = 'api.pokemontcg.io',
    this.apiVersion = 'v2',
    this.apiKey = '',
  });

  /// From Yaml.
  factory PokemonTCGSettings.fromYaml(String yaml) {
    final YamlMap map = loadYaml(yaml);
    return PokemonTCGSettings(
        apiVersion: map['apiVersion'],
        authority: map['authority'],
        apiKey: map['apiKey']);
  }
}
