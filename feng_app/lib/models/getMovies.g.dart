// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getMovies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovies _$GetMoviesFromJson(Map<String, dynamic> json) {
  return GetMovies()
    ..total = json['total'] as num
    ..movies = json['movies'] as List<Movie>;
}

Map<String, dynamic> _$GetMoviesToJson(GetMovies instance) =>
    <String, dynamic>{'total': instance.total, 'movies': instance.movies};
