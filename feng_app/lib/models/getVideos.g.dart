// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getVideos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVideos _$GetVideosFromJson(Map<String, dynamic> json) {
  return GetVideos()
    ..total = json['total'] as num
    ..videos = (json['videos'] as List)
        ?.map(
            (e) => e == null ? null : Video.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetVideosToJson(GetVideos instance) =>
    <String, dynamic>{'total': instance.total, 'videos': instance.videos};
