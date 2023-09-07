import 'package:dio/dio.dart';
import 'package:flutter_clean_riverpod/core/constants.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/entities/film.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LandingApi {
  factory LandingApi(Dio dio) = _LandingApi;

  @GET("/list.json")
  Future<HttpResponse<List<Film>>> getFilms();
}
