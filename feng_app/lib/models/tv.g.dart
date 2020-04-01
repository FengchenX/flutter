// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tv _$TvFromJson(Map<String, dynamic> json) {
  return Tv()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..thumb = json['thumb'] as String
    ..describe = json['describe'] as String
    ..videos = (json['videos'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$TvToJson(Tv instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': instance.thumb,
      'describe': instance.describe,
      'videos': instance.videos
    };
