class ServicePathNotDefinedException<T> implements Exception {
  final T exception;

  ServicePathNotDefinedException(this.exception);
  @override
  String toString() {
    return 'Service path not defined : $T';
  }
}
