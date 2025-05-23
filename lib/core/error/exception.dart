class ErrorModelException implements Exception {
  final String errorMessage;

  ErrorModelException({required this.errorMessage});

  factory ErrorModelException.fromJson(Map<String, dynamic> json) {
    return ErrorModelException(errorMessage: json['message'].toString().split('%').last);
  }
}
class SiginGoogleException implements Exception {}

class SiginApplexception implements Exception {}

class ServerException implements Exception {}

class ConnectionTimeoutException implements Exception {}

class UnauthorizedException implements Exception {}

class InternetException implements Exception {}
