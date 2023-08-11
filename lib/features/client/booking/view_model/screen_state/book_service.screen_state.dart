import '../../../../../core/new_http/models/client_exception.dart';

class BookServiceStatus {
  BookServiceStatus._();

  factory BookServiceStatus.success() = BookSuccess;
  factory BookServiceStatus.error(final ClientException requestError) =
      BookError;
  factory BookServiceStatus.loading() = BookLoading;
}

class BookError extends BookServiceStatus {
  BookError(this.requestError) : super._();

  final ClientException requestError;
}

class BookSuccess extends BookServiceStatus {
  BookSuccess() : super._();
}

class BookLoading extends BookServiceStatus {
  BookLoading() : super._();
}
