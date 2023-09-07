import 'package:flutter_clean_riverpod/screens/landing/data/datasources/api.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/entities/film.dart';
import 'package:flutter_clean_riverpod/core/resources/datastate.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/repositories/landing_repository.dart';

class LandingRepositoryImp extends LandingRepository {
  final LandingApi api;

  LandingRepositoryImp(this.api);

  @override
  Future<DataState<List<Film>>> getFilms() async {
    try {
      final result = await api.getFilms();
      if (result.response.statusCode == 200) {
        return DataSuccess(result.data);
      } else {
        return DataFailed("network error");
      }
    } catch (e) {
      return DataFailed('error ${e.toString()}');
    }
  }
}
