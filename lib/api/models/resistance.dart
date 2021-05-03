import 'package:elve_tcg_poke/enums/type_enum.dart';
import 'package:elve_tcg_poke/utils/card_utils.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resistance.g.dart';

@JsonSerializable()
class Resistance {
  static PokeType _typeFromJson(String? str) {
    if (str == null) {
      return PokeType.colorless;
    }
    return (str.isEmpty) ? PokeType.colorless : str2PokeType(str);
  }

  @JsonKey(fromJson: _typeFromJson)
  final PokeType type;
  final String value;

  const Resistance(this.type, this.value);

  factory Resistance.fromJson(Map<String, dynamic> json) =>
      _$ResistanceFromJson(json);
  Map<String, dynamic> toJson() => _$ResistanceToJson(this);

  /// Get Resistance color based on the first type.
  Color get color => Color(typeColorResolver(type));

  /// Get Resistance icon based on the first type.
  String get icon => svgIconResolver(type);
}
