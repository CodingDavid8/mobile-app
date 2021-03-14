import 'package:deus_mobile/routes/navigation_item.dart';
import 'package:deus_mobile/routes/navigation_service.dart';
import 'package:deus_mobile/service/analytics_service.dart';
import 'package:get_it/get_it.dart';

import 'provider_service.dart';

GetIt locator = GetIt.instance;

/// Enables easy access to single instances of services.
///
/// Usage:
/// ```dart
/// locator<ServiceClass>().serviceMethodOfThatClass
/// ```
void setupLocator() {
  locator.registerLazySingleton<OmniServices>(() => OmniServices());
  locator.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService(selectedNavItem: NavigationItem.swap));
}
