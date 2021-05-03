// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardImage _$CardImageFromJson(Map<String, dynamic> json) {
  return CardImage(
    json['small'] as String,
    json['large'] as String,
  );
}

Map<String, dynamic> _$CardImageToJson(CardImage instance) => <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
    };
