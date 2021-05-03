// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeSet _$PokeSetFromJson(Map<String, dynamic> json) {
  return PokeSet(
    json['id'] as String,
    json['name'] as String,
    json['series'] as String,
    json['printedTotal'] as int,
    json['total'] as int,
    Legality.fromJson(json['legalities'] as Map<String, dynamic>),
    json['releaseDate'] as String,
    json['updatedAt'] as String,
    SetImage.fromJson(json['images'] as Map<String, dynamic>),
    ptcgoCode: json['ptcgoCode'] as String?,
  );
}

Map<String, dynamic> _$PokeSetToJson(PokeSet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'series': instance.series,
      'printedTotal': instance.printedTotal,
      'total': instance.total,
      'legalities': instance.legalities,
      'releaseDate': instance.releaseDate,
      'updatedAt': instance.updatedAt,
      'images': instance.images,
      'ptcgoCode': instance.ptcgoCode,
    };
