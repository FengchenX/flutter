import 'package:json_annotation/json_annotation.dart';
import "tv.dart";
part 'getTVs.g.dart';

@JsonSerializable()
class GetTVs {
    GetTVs();

    num total;
    List<Tv> tvs;
    
    factory GetTVs.fromJson(Map<String,dynamic> json) => _$GetTVsFromJson(json);
    Map<String, dynamic> toJson() => _$GetTVsToJson(this);
}
