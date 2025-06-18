class ErrorModel {
  final int? status;
  final String errorMessage;

  ErrorModel({
    this.status,
    required this.errorMessage,
  });

  factory ErrorModel.fromJson(Map jsonData) {
    return ErrorModel(
      errorMessage: jsonData["Message"] ?? "Unknown error",
      status: jsonData["status"],
    );
  }

  factory ErrorModel.fromFirebase(String code, String message) {
    return ErrorModel(
      status: 401,
      errorMessage: "$code: $message",
    );
  }

  @override
  String toString() => errorMessage;
}
