// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeCard _$PokeCardFromJson(Map<String, dynamic> json) {
  return PokeCard(
    json['id'] as String,
    json['name'] as String,
    json['number'] as String,
    CardImage.fromJson(json['images'] as Map<String, dynamic>),
    PokeCard._typesFromJson(json['types']),
    artist: json['artist'] as String?,
    tcgplayer: json['tcgplayer'] == null
        ? null
        : TCGPlayer.fromJson(json['tcgplayer'] as Map<String, dynamic>),
    cardSet: json['set'] == null
        ? null
        : PokeSet.fromJson(json['set'] as Map<String, dynamic>),
    legalities: json['legalities'] == null
        ? null
        : Legality.fromJson(json['legalities'] as Map<String, dynamic>),
    nationalPokedexNumbers: (json['nationalPokedexNumbers'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList(),
    hp: json['hp'] as String?,
    rules: (json['rules'] as List<dynamic>?)?.map((e) => e as String).toList(),
    rarity: json['rarity'] as String?,
    supertype: json['supertype'] as String?,
    subtypes:
        (json['subtypes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    abilities: (json['abilities'] as List<dynamic>?)
        ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
        .toList(),
    attacks: (json['attacks'] as List<dynamic>?)
        ?.map((e) => Attack.fromJson(e as Map<String, dynamic>))
        .toList(),
    weaknesses: (json['weaknesses'] as List<dynamic>?)
        ?.map((e) => Weakness.fromJson(e as Map<String, dynamic>))
        .toList(),
    resistances: (json['resistances'] as List<dynamic>?)
        ?.map((e) => Resistance.fromJson(e as Map<String, dynamic>))
        .toList(),
    retreatCost: (json['retreatCost'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    convertedRetreatCost: json['convertedRetreatCost'] as int?,
    flavorText: json['flavorText'] as String?,
    evolvesFrom: json['evolvesFrom'] as String?,
    evolvesTo:
        (json['evolvesTo'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PokeCardToJson(PokeCard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'images': instance.images,
      'artist': instance.artist,
      'tcgplayer': instance.tcgplayer,
      'legalities': instance.legalities,
      'set': instance.cardSet,
      'hp': instance.hp,
      'rarity': instance.rarity,
      'supertype': instance.supertype,
      'rules': instance.rules,
      'types': instance.types.map((e) => _$PokeTypeEnumMap[e]).toList(),
      'subtypes': instance.subtypes,
      'abilities': instance.abilities,
      'attacks': instance.attacks,
      'weaknesses': instance.weaknesses,
      'resistances': instance.resistances,
      'retreatCost': instance.retreatCost,
      'convertedRetreatCost': instance.convertedRetreatCost,
      'flavorText': instance.flavorText,
      'evolvesFrom': instance.evolvesFrom,
      'evolvesTo': instance.evolvesTo,
      'nationalPokedexNumbers': instance.nationalPokedexNumbers,
    };

const _$PokeTypeEnumMap = {
  PokeType.colorless: 'colorless',
  PokeType.darkness: 'darkness',
  PokeType.dragon: 'dragon',
  PokeType.fairy: 'fairy',
  PokeType.fighting: 'fighting',
  PokeType.fire: 'fire',
  PokeType.grass: 'grass',
  PokeType.lightning: 'lightning',
  PokeType.metal: 'metal',
  PokeType.psychic: 'psychic',
  PokeType.water: 'water',
};
