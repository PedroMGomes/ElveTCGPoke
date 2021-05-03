import 'package:json_annotation/json_annotation.dart';

part 'image_set.g.dart';

@JsonSerializable()
class SetImage {
  final String symbol;
  final String logo;
  const SetImage(this.symbol, this.logo);

  factory SetImage.fromJson(Map<String, dynamic> json) =>
      _$SetImageFromJson(json);
  Map<String, dynamic> toJson() => _$SetImageToJson(this);
}
