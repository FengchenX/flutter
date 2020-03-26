// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..creator = json['creator'] as String
    ..create_at = json['create_at'] as String
    ..thumb = json['thumb'] as String
    ..describe = json['describe'] as String
    ..year = json['year'] as num
    ..video_id = json['video_id'] as String;
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creator': instance.creator,
      'create_at': instance.create_at,
      'thumb': instance.thumb,
      'describe': instance.describe,
      'year': instance.year,
      'video_id': instance.video_id
    };
