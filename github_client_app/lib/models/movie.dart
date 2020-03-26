import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
    Movie();

    String id;
    String name;
    String creator;
    String create_at;
    String thumb;
    String describe;
    num year;
    String video_id;
    
    factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);
    Map<String, dynamic> toJson() => _$MovieToJson(this);
}
