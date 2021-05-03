// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetImage _$SetImageFromJson(Map<String, dynamic> json) {
  return SetImage(
    json['symbol'] as String,
    json['logo'] as String,
  );
}

Map<String, dynamic> _$SetImageToJson(SetImage instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'logo': instance.logo,
    };
