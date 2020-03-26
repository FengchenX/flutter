import 'package:json_annotation/json_annotation.dart';

part 'pageFilter.g.dart';

@JsonSerializable()
class PageFilter {
    PageFilter();

    String limit;
    String offset;
    String sort;
    String order;
    
    factory PageFilter.fromJson(Map<String,dynamic> json) => _$PageFilterFromJson(json);
    Map<String, dynamic> toJson() => _$PageFilterToJson(this);
}
