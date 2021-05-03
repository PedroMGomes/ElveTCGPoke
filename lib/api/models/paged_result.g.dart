// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedResult<T> _$PagedResultFromJson<T>(Map<String, dynamic> json) {
  return PagedResult<T>(
    json['page'] as int,
    json['pageSize'] as int,
    json['count'] as int,
    json['totalCount'] as int,
    (json['data'] as List<dynamic>)
        .map(PagedResultDataConverter<T>().fromJson)
        .toList(),
  );
}

Map<String, dynamic> _$PagedResultToJson<T>(PagedResult<T> instance) =>
    <String, dynamic>{
      'data': instance.data.map(PagedResultDataConverter<T>().toJson).toList(),
      'page': instance.page,
      'pageSize': instance.pageSize,
      'count': instance.count,
      'totalCount': instance.totalCount,
    };
