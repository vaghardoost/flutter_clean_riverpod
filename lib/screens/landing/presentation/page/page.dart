import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/screens/landing/presentation/riverpod/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_clean_riverpod/screens/landing/presentation/widgets/widgets.dart';

class LangingPage extends ConsumerWidget {
  const LangingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final action = ref.watch(provider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          (state is LoadingState)
              ? state.message!
              : (state is ErrorState)
                  ? "Network Error"
                  : "IMDB Movies",
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          action.load();
        },
        child: Builder(
          builder: (context) {
            if (state is LoadingState) {}
            if (state is ErrorState) {}
            if (state is LoadedState) {
              return ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  const TitleWidget("In Top 250 Movies"),
                  SliderWidget(films: state.data!.metadata.slider),
                  const TitleWidget("Top 10"),
                  ...state.data!.topTen
                      .map<Widget>((film) => FilmWidget(film))
                      .toList(),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
