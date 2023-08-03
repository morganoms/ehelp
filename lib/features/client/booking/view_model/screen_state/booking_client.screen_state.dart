import '../../../../../core/new_http/models/client_exception.dart';

class BookingClientScreenStatus {
  BookingClientScreenStatus._();

  factory BookingClientScreenStatus.success(final List<int> data) =
      ScreenSuccess;
  factory BookingClientScreenStatus.error(final ClientException requestError) =
      ScreenError;
  factory BookingClientScreenStatus.loading() = ScreenLoading;
}

class ScreenError extends BookingClientScreenStatus {
  ScreenError(this.requestError) : super._();

  final ClientException requestError;
}

class ScreenSuccess extends BookingClientScreenStatus {
  ScreenSuccess(this.data) : super._();

  final List<int> data;
}

class ScreenLoading extends BookingClientScreenStatus {
  ScreenLoading() : super._();
}
