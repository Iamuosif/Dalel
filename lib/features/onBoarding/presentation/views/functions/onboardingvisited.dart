import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/services/services_locator.dart';

void isonBoardingVisited() {
  getIt<CacheHelper>().saveData(key: 'isonBoardingVisited', value: true);
}
