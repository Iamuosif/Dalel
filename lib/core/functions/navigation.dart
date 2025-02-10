import 'package:dalel/features/search/data/model/search_model.dart';
import 'package:go_router/go_router.dart';

void customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void customNavigate(context, String path, {Object? extra}) {
  GoRouter.of(context).push(path, extra: extra);
}

customSearchNavigate(context, SearchItem result) {
  switch (result.type) {
    case SearchType.character:
      GoRouter.of(context)
          .push('/HistoricalCharactersDetailsView', extra: result.data);
      break;
    case SearchType.war:
      GoRouter.of(context).push('/home', extra: result.data);
      break;
    case SearchType.period:
      GoRouter.of(context)
          .push('/HistoricalPeriodsDetailsView', extra: result.data);
      break;
    case SearchType.souvenir:
      GoRouter.of(context).push('/home', extra: result.data);
      break;
    case SearchType.book:
      GoRouter.of(context).push('/bazar', extra: result.data);
      break;
  }
}
