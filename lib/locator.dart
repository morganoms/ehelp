import 'package:ehelp/features/professional/areas/view_model/home_area.view_model.dart';
import 'package:get_it/get_it.dart';

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
      );
  }
}
