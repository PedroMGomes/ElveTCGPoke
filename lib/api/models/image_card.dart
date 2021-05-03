import 'package:json_annotation/json_annotation.dart';

part 'image_card.g.dart';

@JsonSerializable()
class CardImage {
  final String small;
  final String large;
  const CardImage(this.small, this.large);

  factory CardImage.fromJson(Map<String, dynamic> json) =>
      _$CardImageFromJson(json);
  Map<String, dynamic> toJson() => _$CardImageToJson(this);
}
