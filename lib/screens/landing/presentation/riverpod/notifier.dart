part of 'provider.dart';

class LandingPageNotifier extends StateNotifier<State> {
  final LandingUseCase usecase;

  LandingPageNotifier({
    required State state,
    required this.usecase,
  }) : super(state) {
    load();
  }

  Future<void> load() async {
    state = LoadingState(message: 'Downloading Data...');
    final response = await usecase.call();
    final rangeForSlider = Random().nextInt(244);
    if (response is DataSuccess) {
      final list = response.data!;
      state = LoadedState(
        data: Data(
          topTen: list.sublist(0, 9),
          metadata: Metadata(
            header: list[Random().nextInt(249)].image,
            slider: list.sublist(rangeForSlider, rangeForSlider + 5),
          ),
        ),
      );
    }
    if (response is DataFailed) {
      state = ErrorState(error: response.err!);
    }
  }
}
