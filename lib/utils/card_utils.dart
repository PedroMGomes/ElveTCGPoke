import 'package:elve_tcg_poke/enums/type_enum.dart';

/// Pokemon type color map.
final _typeColorMap = <PokeType, int>{
  PokeType.colorless: 0xFF969685,
  PokeType.darkness: 0xFF705848,
  PokeType.dragon: 0xFF7038F8,
  PokeType.fairy: 0xFFF0B6BC,
  PokeType.fighting: 0xFFC03028,
  PokeType.fire: 0xFFF08030,
  PokeType.grass: 0xFF78C850,
  PokeType.lightning: 0xFFAD9121,
  PokeType.metal: 0xFFB8B8D0,
  PokeType.psychic: 0xFFF85888,
  PokeType.water: 0xFF6890F0,
};

/// Pokemn type icon map.
final _typeIconMap = <PokeType, String>{
  PokeType.colorless: 'assets/icons/normal.svg',
  PokeType.darkness: 'assets/icons/dark.svg',
  PokeType.dragon: 'assets/icons/dragon.svg',
  PokeType.fairy: 'assets/icons/fairy.svg',
  PokeType.fighting: 'assets/icons/fighting.svg',
  PokeType.fire: 'assets/icons/fire.svg',
  PokeType.grass: 'assets/icons/grass.svg',
  PokeType.lightning: 'assets/icons/electric.svg',
  PokeType.metal: 'assets/icons/steel.svg',
  PokeType.psychic: 'assets/icons/psychic.svg',
  PokeType.water: 'assets/icons/water.svg',
};

String pokeType2str(PokeType type) => type.toString().split('.')[1];

PokeType str2PokeType(String str) => PokeType.values.firstWhere(
    (v) => pokeType2str(v).compareTo(str.toLowerCase()) == 0,
    orElse: () => PokeType.colorless);

/// Type color resolver.
int typeColorResolver(PokeType type) => _typeColorMap[type] as int;

/// Icon resolver.
/// https://github.com/duiker101/pokemon-type-svg-icons/releases/tag/1.0.0
String svgIconResolver(PokeType type) => _typeIconMap[type] as String;
