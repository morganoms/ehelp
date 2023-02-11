import 'package:get_it/get_it.dart';

import 'features/client/booking/view_model/booking.view_model.dart';
import 'features/client/call_now/view_model/call_now.view_model.dart';
import 'features/client/call_now/view_model/service_description.view_Model.dart';
import 'features/client/home/view_model/home_client.view_model.dart';
import 'features/professional/areas/view_model/home_area.view_model.dart';
import 'features/professional/areas/view_model/home_edit_area.view_model.dart';
import 'features/professional/home/view_model/home_professional.view_model.dart';

final GetIt locator = GetIt.instance;

class EHelpDependencies {
  void setup() {
    locator
      ..registerSingleton<HomeClientViewModel>(
        HomeClientViewModel(),
      )
      ..registerSingleton<HomeAreaViewModel>(
        HomeAreaViewModel(),
      )
      ..registerSingleton<HomeEditAreaViewModel>(
        HomeEditAreaViewModel(),
      )
      ..registerSingleton<BookingViewModel>(
        BookingViewModel(),
      )
      ..registerLazySingleton<ServiceDescriptionViewModel>(
        ServiceDescriptionViewModel.new,
      )
      ..registerLazySingleton<HomeProfessionalViewModel>(
        HomeProfessionalViewModel.new,
      )
      ..registerLazySingleton<CallNowViewModel>(
        CallNowViewModel.new,
      );
  }
}
