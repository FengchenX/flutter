// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..url = json['url'] as String
    ..describe = json['describe'] as String
    ..thumb = json['thumb'] as String
    ..creator = json['creator'] as String
    ..create_at = json['create_at'] as String;
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'describe': instance.describe,
      'thumb': instance.thumb,
      'creator': instance.creator,
      'create_at': instance.create_at
    };
