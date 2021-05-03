import 'package:json_annotation/json_annotation.dart';

part 'legality.g.dart';

@JsonSerializable()
class Legality {
  final String? unlimited;
  final String? expanded;
  final String? standard;
  const Legality({this.unlimited, this.expanded, this.standard});

  factory Legality.fromJson(Map<String, dynamic> json) =>
      _$LegalityFromJson(json);
  Map<String, dynamic> toJson() => _$LegalityToJson(this);
}
