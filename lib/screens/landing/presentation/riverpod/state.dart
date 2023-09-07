part of 'provider.dart';

class Data {
  final List<Film> topTen;
  final Metadata metadata;

  Data({
    required this.topTen,
    required this.metadata,
  });
}

class Metadata {
  final String header;
  final List<Film> slider;

  Metadata({
    required this.header,
    required this.slider,
  });
}

abstract class State {
  final Data? data;
  final String? message;

  const State({this.data, this.message});
}

class LoadingState extends State {
  LoadingState({required String message}) : super(message: message);
}

class LoadedState extends State {
  LoadedState({required Data data}) : super(data: data);
}

class ErrorState extends State {
  ErrorState({required String error}) : super(message: error);
}
