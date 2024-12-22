import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());

// Alternatively you could write it if you don't like global variables
  //GetIt.I.registerSingleton<CacheHelper>(CacheHelper());
}
