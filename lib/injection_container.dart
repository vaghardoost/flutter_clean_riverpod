import 'package:dio/dio.dart';
import 'package:flutter_clean_riverpod/screens/landing/data/datasources/api.dart';
import 'package:flutter_clean_riverpod/screens/landing/data/repositories/landing_repository.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/usecase/landing_usecase.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  s1.registerSingleton(
    LandingUseCase(
      LandingRepositoryImp(LandingApi(dio)),
    ),
  );
}
