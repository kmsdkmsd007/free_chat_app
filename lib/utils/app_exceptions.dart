class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException(this.message, [this.prefix]);

  @override
  String toString() {
    return "${prefix ?? 'Error'}: $message";
  }
}

class NetworkException extends AppException {
  NetworkException([String message = "Unable to connect to the network."])
      : super(message, "Network Error");
}

class ServerException extends AppException {
  ServerException([String message = "Server is currently unavailable."])
      : super(message, "Server Error");
}

class CacheException extends AppException {
  CacheException([String message = "Failed to retrieve data from cache."])
      : super(message, "Cache Error");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String message = "Unauthorized access."])
      : super(message, "Unauthorized Error");
}

class NotFoundException extends AppException {
  NotFoundException([String message = "Requested resource not found."])
      : super(message, "Not Found Error");
}

class ValidationException extends AppException {
  ValidationException([String message = "Invalid input provided."])
      : super(message, "Validation Error");
}
