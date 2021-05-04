import 'package:elve_tcg_poke/api/models/poke_card.dart';
import 'package:elve_tcg_poke/api/models/poke_set.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paged_result.g.dart';

@JsonSerializable()
class PagedResult<T> {
  @PagedResultDataConverter()
  final List<T> data;
  final int page;
  final int pageSize;
  final int count;
  final int totalCount;

  const PagedResult(
    this.page,
    this.pageSize,
    this.count,
    this.totalCount,
    this.data,
  );

  factory PagedResult.fromJson(Map<String, dynamic> json) =>
      _$PagedResultFromJson(json);
  Map<String, dynamic> toJson() => _$PagedResultToJson(this);
}

/// Data type `T` to convert to and from.
/// Object is the type of the value stored in json. It must be a valid json stype such as `String`, `int` or `Map<String, dynamic>`
class PagedResultDataConverter<T> implements JsonConverter<T, Object?> {
  const PagedResultDataConverter();

  /// From valid `json` format: `String`, `int`, `Map<String, dynamic>`. ✅
  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('artist') || json.containsKey('number')) {
        // Check for card specific properties .
        return PokeCard.fromJson(json) as T;
      } else if (json.containsKey('series') ||
          json.containsKey('printedTotal')) {
        // Check for sets specific properties.
        return PokeSet.fromJson(json) as T;
      }
    } else if (json is String) {
      throw Exception('Not expecting a Json string.');
    } else if (json is int) {
      throw Exception('Not expecting a Json int encoded.');
    }
    // return json as T; // only works if json is a valid primitive type.
    throw Exception('$runtimeType - error!');
  }

  /// Calls the `toJson` from `T object`. ✅
  @override
  Object? toJson(T object) {
    return object;
  }
}
