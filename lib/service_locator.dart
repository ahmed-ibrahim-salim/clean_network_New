import 'package:get_it/get_it.dart';

import 'core/placeholder_service.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  // register & inistantiate viewModel with service

  // locator.registerSingleton<HomeViewModel>(
  //     HomeViewModel(repo: JsonPlaceHolderService()));

  locator.registerFactory<HomeRepo>(() => JsonPlaceHolderService());
}
