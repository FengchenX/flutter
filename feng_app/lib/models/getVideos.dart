import 'package:json_annotation/json_annotation.dart';
import "video.dart";
part 'getVideos.g.dart';

@JsonSerializable()
class GetVideos {
    GetVideos();

    num total;
    List<Video> videos;
    
    factory GetVideos.fromJson(Map<String,dynamic> json) => _$GetVideosFromJson(json);
    Map<String, dynamic> toJson() => _$GetVideosToJson(this);
}
