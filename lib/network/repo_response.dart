class RepoResponse<T> {
  final String? error;
  final T? data;

  bool get hasData => data != null && error == null;
  bool get hasError => error != null;

  RepoResponse({this.error, this.data});
}