// containe list of top 10 Films
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'film.freezed.dart';
part 'film.g.dart';

@freezed
class Film with _$Film {
  const factory Film({
    required String id,
    required String title,
    required String image,
    required String rank,
  }) = _Film;

  factory Film.fromJson(Map<String, Object?> json)
      => _$FilmFromJson(json);
}
