import 'package:elve_tcg_poke/api/models/image_set.dart';
import 'package:elve_tcg_poke/api/models/legality.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poke_set.g.dart';

@JsonSerializable()
class PokeSet {
  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final Legality legalities;
  final String releaseDate;
  final String updatedAt;
  final SetImage images;

  final String? ptcgoCode;

  const PokeSet(
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.releaseDate,
    this.updatedAt,
    this.images, {
    this.ptcgoCode,
  });

  factory PokeSet.fromJson(Map<String, dynamic> json) =>
      _$PokeSetFromJson(json);
  Map<String, dynamic> toJson() => _$PokeSetToJson(this);
}
