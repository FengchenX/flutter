// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getTVs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTVs _$GetTVsFromJson(Map<String, dynamic> json) {
  return GetTVs()
    ..total = json['total'] as num
    ..tvs = (json['tvs'] as List)
        ?.map((e) => e == null ? null : Tv.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetTVsToJson(GetTVs instance) =>
    <String, dynamic>{'total': instance.total, 'tvs': instance.tvs};
