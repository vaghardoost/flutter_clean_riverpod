// this part that mean everything i want from data

import 'package:flutter_clean_riverpod/core/resources/datastate.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/entities/film.dart';

abstract class LandingRepository {
  Future<DataState<List<Film>>> getFilms();
}
