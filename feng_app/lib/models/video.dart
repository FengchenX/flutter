import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
    Video();

    String id;
    String name;
    String url;
    String describe;
    String thumb;
    String creator;
    String create_at;
    
    factory Video.fromJson(Map<String,dynamic> json) => _$VideoFromJson(json);
    Map<String, dynamic> toJson() => _$VideoToJson(this);
}
