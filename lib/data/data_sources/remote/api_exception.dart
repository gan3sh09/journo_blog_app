class ApiException implements Exception {
  final dynamic message;

  ApiException({required this.message});

  @override
  String toString() {
    if (message is String) {
      return message;
    }
    return 'Error Occurred: $message';
  }
}

class NoInternetException extends ApiException {
  NoInternetException([String? message])
      : super(message: 'No Internet Connection');
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message])
      : super(message: 'You don\'t have access to this');
}

class RequestTimeOutException extends ApiException {
  RequestTimeOutException([String? message])
      : super(message: 'Request Time Out');
}

class FetchDataException extends ApiException {
  FetchDataException([String? message]) : super(message: null);
}
