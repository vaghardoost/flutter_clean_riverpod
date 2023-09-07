import 'package:flutter_clean_riverpod/core/resources/datastate.dart';
import 'package:flutter_clean_riverpod/core/usecases/usecase.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/entities/film.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/repositories/landing_repository.dart';

class LandingUseCase extends UseCase<DataState<List<Film>>, void> {
  final LandingRepository _repository;

  LandingUseCase(this._repository);

  @override
  Future<DataState<List<Film>>> call({void params}) {
    return _repository.getFilms();
  }
}
