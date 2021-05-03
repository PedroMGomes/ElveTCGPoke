import 'package:elve_tcg_poke/api/models/ability.dart';
import 'package:elve_tcg_poke/api/models/attack.dart';
import 'package:elve_tcg_poke/api/models/image_card.dart';
import 'package:elve_tcg_poke/api/models/legality.dart';
import 'package:elve_tcg_poke/api/models/resistance.dart';
import 'package:elve_tcg_poke/api/models/poke_set.dart';
import 'package:elve_tcg_poke/api/models/tcg_player.dart';
import 'package:elve_tcg_poke/api/models/weakness.dart';
import 'package:elve_tcg_poke/enums/type_enum.dart';
import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poke_card.g.dart';

@JsonSerializable()
class PokeCard {
  static List<PokeType> _typesFromJson(List<dynamic>? data) {
    if (data == null) {
      return [];
    }
    if (data.isEmpty) {
      return [];
    }
    final List<PokeType> types = [];
    for (final str in data) {
      final type = str2PokeType(str);
      types.add(type);
    }
    return types;
  }

  final String id;
  final String name;
  final String number;

  final CardImage images;

  /// Optional.
  final String? artist;
  final TCGPlayer? tcgplayer;
  final Legality? legalities;
  @JsonKey(name: 'set')
  final PokeSet? cardSet;
  final String? hp;
  final String? rarity;
  final String? supertype;
  final List<String>? rules;
  @JsonKey(fromJson: _typesFromJson)
  final List<PokeType> types;
  final List<String>? subtypes;
  final List<Ability>? abilities;
  final List<Attack>? attacks;
  final List<Weakness>? weaknesses;
  final List<Resistance>? resistances;
  final List<String>? retreatCost;
  final int? convertedRetreatCost;
  final String? flavorText;
  final String? evolvesFrom;
  final List<String>? evolvesTo;
  final List<int>? nationalPokedexNumbers;

  const PokeCard(
    this.id,
    this.name,
    this.number,
    this.images,
    this.types, {
    this.artist,
    this.tcgplayer,
    this.cardSet,
    this.legalities,
    this.nationalPokedexNumbers,
    this.hp,
    this.rules,
    this.rarity,
    this.supertype,
    this.subtypes,
    this.abilities,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.flavorText,
    this.evolvesFrom,
    this.evolvesTo,
  });

  factory PokeCard.fromJson(Map<String, dynamic> json) =>
      _$PokeCardFromJson(json);
  Map<String, dynamic> toJson() => _$PokeCardToJson(this);

  @override
  String toString() => toJson().toString();

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is PokeCard) {
      return this.id == other.id;
    }
    return false;
  }

  /// Get pokemon color based on the first type.
  Color get color => Color((types.isEmpty)
      ? typeColorResolver(PokeType.colorless)
      : typeColorResolver(types.first));

  /// Get pokemon icon based on the first type.
  String get icon =>
      svgIconResolver(types.isEmpty ? PokeType.colorless : types.first);
}
