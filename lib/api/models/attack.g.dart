// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attack _$AttackFromJson(Map<String, dynamic> json) {
  return Attack(
    json['name'] as String,
    Attack._typesFromJson(json['cost']),
    json['convertedEnergyCost'] as int?,
    json['text'] as String?,
    json['damage'] as String? ?? '0',
  );
}

Map<String, dynamic> _$AttackToJson(Attack instance) => <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost.map((e) => _$PokeTypeEnumMap[e]).toList(),
      'convertedEnergyCost': instance.convertedEnergyCost,
      'damage': instance.damage,
      'text': instance.text,
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
