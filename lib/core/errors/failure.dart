abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

/// Failure from Firebase, Dio, HTTP, etc.
class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}

/// No Internet Connection
class ConnectionFailure extends Failure {
  ConnectionFailure() : super(errMessage: "No internet connection.");
}

/// Local Cache Issues
class CacheFailure extends Failure {
  CacheFailure({required super.errMessage});
}
