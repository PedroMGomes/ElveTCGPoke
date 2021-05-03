// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Legality _$LegalityFromJson(Map<String, dynamic> json) {
  return Legality(
    unlimited: json['unlimited'] as String?,
    expanded: json['expanded'] as String?,
    standard: json['standard'] as String?,
  );
}

Map<String, dynamic> _$LegalityToJson(Legality instance) => <String, dynamic>{
      'unlimited': instance.unlimited,
      'expanded': instance.expanded,
      'standard': instance.standard,
    };
