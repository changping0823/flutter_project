// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpResponse<T> _$HttpResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    HttpResponse<T>(
      pageCount: (json['pageCount'] as num?)?.toInt() ?? 0,
      curPage: (json['curPage'] as num?)?.toInt(),
      datas: _$nullableGenericFromJson(json['datas'], fromJsonT),
      offset: (json['offset'] as num?)?.toInt(),
      over: json['over'] as bool?,
      size: (json['size'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HttpResponseToJson<T>(
  HttpResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': _$nullableGenericToJson(instance.datas, toJsonT),
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
