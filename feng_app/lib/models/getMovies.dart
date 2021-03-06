import 'package:json_annotation/json_annotation.dart';
import "movie.dart";
part 'getMovies.g.dart';

@JsonSerializable()
class GetMovies {
    GetMovies();

    num total;
    List<Movie> movies;
    
    factory GetMovies.fromJson(Map<String,dynamic> json) => _$GetMoviesFromJson(json);
    Map<String, dynamic> toJson() => _$GetMoviesToJson(this);
}
