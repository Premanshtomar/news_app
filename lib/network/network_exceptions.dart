class CustomException implements Exception {
  final String message;
  final String _prefix;

  CustomException([this.message = "", this._prefix = ""]);

  @override
  String toString() {
    return "$_prefix$message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message = ""])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message = ""])
      : super(message, "Invalid Input: ");
}
