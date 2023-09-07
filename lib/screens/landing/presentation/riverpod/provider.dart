import 'dart:math';

import 'package:flutter_clean_riverpod/core/resources/datastate.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/entities/film.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/usecase/landing_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

part 'notifier.dart';
part 'state.dart';

final provider = StateNotifierProvider<LandingPageNotifier, State>((ref) {
  final usecase = GetIt.I.get<LandingUseCase>();
  return LandingPageNotifier(state: LoadingState(message: 'Init Data'), usecase: usecase);
});

