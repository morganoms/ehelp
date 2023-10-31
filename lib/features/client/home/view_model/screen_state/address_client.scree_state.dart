import '../../../../../core/new_http/models/client_exception.dart';

class AddressClientScreenStatus {
  AddressClientScreenStatus._();

  factory AddressClientScreenStatus.success() = ScreenSuccess;
  factory AddressClientScreenStatus.error(final ClientException requestError) =
      ScreenError;
  factory AddressClientScreenStatus.loading() = ScreenLoading;
}

class ScreenError extends AddressClientScreenStatus {
  ScreenError(this.requestError) : super._();

  final ClientException requestError;
}

class ScreenSuccess extends AddressClientScreenStatus {
  ScreenSuccess() : super._();
}

class ScreenLoading extends AddressClientScreenStatus {
  ScreenLoading() : super._();
}
