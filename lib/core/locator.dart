import 'package:ehelp/core/http/http_core.dart';
import 'package:ehelp/core/token/token.controller.dart';
import 'package:ehelp/core/user/user.controller.dart';
import 'package:ehelp/features/login/model/service/login_remote.service.dart';
import 'package:ehelp/features/login/view_models/login.view_model.dart';
import 'package:ehelp/features/professional/call_now/view_model/call_now_professional.view_model.dart';
import 'package:get_it/get_it.dart';

import '../features/client/booking/view_model/booking.view_model.dart';
import '../features/client/call_now/view_model/call_now.view_model.dart';
import '../features/client/call_now/view_model/service_description.view_Model.dart';
import '../features/client/home/view_model/home_client.view_model.dart';
import '../features/professional/areas/view_model/home_area.view_model.dart';
import '../features/professional/areas/view_model/home_edit_area.view_model.dart';
import '../features/professional/home/view_model/home_professional.view_model.dart';

final GetIt locator = GetIt.instance;

class EHelpDependencies {
  final LoginRemoteService loginService = LoginRemoteService(HttpCore());

  void setup() {
    locator
      ..registerLazySingleton<HomeClientViewModel>(HomeClientViewModel.new)
      ..registerSingleton<HomeAreaViewModel>(HomeAreaViewModel())
      ..registerLazySingleton<UserController>(UserController.new)
      ..registerLazySingleton<TokenController>(TokenController.new)
      ..registerSingleton<HomeEditAreaViewModel>(HomeEditAreaViewModel())
      ..registerSingleton<BookingViewModel>(BookingViewModel())
      ..registerLazySingleton<ServiceDescriptionViewModel>(
          ServiceDescriptionViewModel.new)
      ..registerLazySingleton<HomeProfessionalViewModel>(
          HomeProfessionalViewModel.new)
      ..registerLazySingleton<CallNowProfessionalViewModel>(
          CallNowProfessionalViewModel.new)
      ..registerLazySingleton<CallNowViewModel>(CallNowViewModel.new)
      ..registerLazySingleton<LoginViewModel>(
          () => LoginViewModel(loginService));
  }
}
