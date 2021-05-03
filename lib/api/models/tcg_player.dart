import 'package:json_annotation/json_annotation.dart';

part 'tcg_player.g.dart';

/// Provide the URL only to check price outside the app.
@JsonSerializable()
class TCGPlayer {
  final String url;
  // final String updatedAt;

  const TCGPlayer(this.url);
  factory TCGPlayer.fromJson(Map<String, dynamic> json) =>
      _$TCGPlayerFromJson(json);
  Map<String, dynamic> toJson() => _$TCGPlayerToJson(this);
}
