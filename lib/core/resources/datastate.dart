abstract class DataState<T> {
  final T? data;
  final String? err;

  const DataState({this.data, this.err});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(String err) : super(err: err);
}
