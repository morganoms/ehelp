import 'package:get_it/get_it.dart';

import 'features/home/view_model/home_client.view_model.dart';

final GetIt locator = GetIt.instance;

class EHelpDependencies {
  void setup() {
    locator.registerSingleton<HomeClientViewModel>(
      HomeClientViewModel(),
    );
  }
}
