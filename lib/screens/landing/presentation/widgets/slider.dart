import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/screens/landing/domain/entities/film.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SliderWidget extends StatefulWidget {
  final List<Film> films;

  const SliderWidget({
    required this.films,
    super.key,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int current = 2;
  final PageController pvCtrl = PageController(
    viewportFraction: 0.75,
    initialPage: 2,
  );

  @override
  void initState() {
    pvCtrl.addListener(() {
      int pos = pvCtrl.page!.round();
      if (current != pos) {
        setState(() => current = pos);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pvCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: PageView.builder(
          controller: pvCtrl,
          itemCount: widget.films.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final film = widget.films[index];
            final double padding = (index == current) ? 10 : 30;

            return AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutQuint,
              padding: EdgeInsets.all(padding),
              child: CachedNetworkImage(
                placeholder: (context, url) => const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                imageUrl: film.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
