import 'package:ehelp/features/booking/view_model/booking.view_model.dart';
import 'package:ehelp/features/call_now/view_model/call_now.view_model.dart';
import 'package:ehelp/features/professional/areas/view_model/home_area.view_model.dart';
import 'package:ehelp/features/professional/areas/view_model/home_edit_area.view_model.dart';
import 'package:get_it/get_it.dart';

import 'features/call_now/view_model/service_description.view_Model.dart';
import 'features/home/view_model/home_client.view_model.dart';

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
      ..registerLazySingleton<CallNowViewModel>(
        CallNowViewModel.new,
      );
  }
}
