// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weakness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weakness _$WeaknessFromJson(Map<String, dynamic> json) {
  return Weakness(
    Weakness._typeFromJson(json['type'] as String?),
    json['value'] as String,
  );
}

Map<String, dynamic> _$WeaknessToJson(Weakness instance) => <String, dynamic>{
      'type': _$PokeTypeEnumMap[instance.type],
      'value': instance.value,
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
