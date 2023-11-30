import 'package:ehelp/core/session/session.controller.dart';
import 'package:ehelp/features/client/booking/models/service/booking_client.service.dart';
import 'package:ehelp/features/client/booking/models/service/booking_client.service_impl.dart';
import 'package:ehelp/features/client/home/model/service/client_address/client_address_remote.dart';

import 'package:ehelp/features/login/model/service/login_remote.service.dart';
import 'package:ehelp/features/login/view_models/login.view_model.dart';
import 'package:ehelp/features/professional/call_now/view_model/call_now_professional.view_model.dart';
import 'package:ehelp/features/professional/home/model/service/home_professional/home_professional.service.dart';
import 'package:ehelp/features/professional/home/model/service/home_professional/home_professional_remote.service.dart';
import 'package:get_it/get_it.dart';

import '../features/client/booking/view_model/controllers/booking.view_model.dart';
import '../features/client/call_now/view_model/call_now.view_model.dart';
import '../features/client/call_now/view_model/service_description.view_Model.dart';
import '../features/client/home/model/service/home_client/home_client.service.dart';
import '../features/client/home/model/service/home_client/home_client_remote.service.dart';

import '../features/client/home/view_model/controllers/address_client.view_model.dart';
import '../features/client/home/view_model/controllers/home_client.view_model.dart';
import '../features/professional/areas/view_model/home_area.view_model.dart';
import '../features/professional/areas/view_model/home_edit_area.view_model.dart';
import '../features/professional/home/view_model/home_professional.view_model.dart';
import 'new_http/http_client.dart';

final GetIt locator = GetIt.instance;

class EHelpDependencies {
  void setup() {
    final httpCoreClient = HttpCoreClient();
    final LoginRemoteService loginService = LoginRemoteService(httpCoreClient);
    final HomeClientService homeClientService =
        HomeClientLocalService(httpCoreClient);
    final BookingClientService bookingClientService =
        BookingClientServiceImpl(httpCoreClient);
    final ClientAddressServiceRemote clientAddress =
        ClientAddressServiceRemote(httpCoreClient);
    final HomeProfessionalService homeProfessional =
        HomeProfessionalRemoteService(httpCoreClient);

    locator
      ..registerSingleton<SessionController>(SessionController())
      ..registerLazySingleton<LoginViewModel>(
          () => LoginViewModel(loginService))
      ..registerLazySingleton<AdressClientViewModel>(
          () => AdressClientViewModel(clientAddress))
      ..registerLazySingleton<HomeClientViewModel>(
          () => HomeClientViewModel(homeClientService))
      ..registerLazySingleton<HomeAreaViewModel>(HomeAreaViewModel.new)
      ..registerLazySingleton<HomeEditAreaViewModel>(HomeEditAreaViewModel.new)
      ..registerLazySingleton<BookingViewModel>(
          () => BookingViewModel(bookingClientService))
      ..registerLazySingleton<ServiceDescriptionViewModel>(
          ServiceDescriptionViewModel.new)
      ..registerLazySingleton<HomeProfessionalViewModel>(
          () => HomeProfessionalViewModel(homeProfessional))
      ..registerLazySingleton<CallNowProfessionalViewModel>(
          CallNowProfessionalViewModel.new)
      ..registerLazySingleton<CallNowViewModel>(CallNowViewModel.new);
  }
}
