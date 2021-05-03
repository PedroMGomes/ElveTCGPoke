import 'package:elve_tcg_poke/enums/type_enum.dart';
import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attack.g.dart';

@JsonSerializable()
class Attack {
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

  final String name;
  @JsonKey(fromJson: _typesFromJson)
  final List<PokeType> cost;
  final int? convertedEnergyCost;
  @JsonKey(defaultValue: '0')
  final String? damage;
  final String? text;

  const Attack(
      this.name, this.cost, this.convertedEnergyCost, this.text, this.damage);
  factory Attack.fromJson(Map<String, dynamic> json) => _$AttackFromJson(json);
  Map<String, dynamic> toJson() => _$AttackToJson(this);

  /// Get attack color based on the first type cost.
  Color get color => Color((cost.isEmpty)
      ? typeColorResolver(PokeType.colorless)
      : typeColorResolver(cost.first));

  /// Get attack icon based on the first cost.
  String get icon =>
      svgIconResolver(cost.isEmpty ? PokeType.colorless : cost.first);
}
