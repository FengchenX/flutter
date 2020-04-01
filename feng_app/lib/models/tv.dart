import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable()
class Tv {
    Tv();

    String id;
    String name;
    String thumb;
    String describe;
    List<String> videos;
    
    factory Tv.fromJson(Map<String,dynamic> json) => _$TvFromJson(json);
    Map<String, dynamic> toJson() => _$TvToJson(this);
}
