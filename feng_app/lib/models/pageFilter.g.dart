// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageFilter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageFilter _$PageFilterFromJson(Map<String, dynamic> json) {
  return PageFilter()
    ..limit = json['limit'] as String
    ..offset = json['offset'] as String
    ..sort = json['sort'] as String
    ..order = json['order'] as String;
}

Map<String, dynamic> _$PageFilterToJson(PageFilter instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'sort': instance.sort,
      'order': instance.order
    };
