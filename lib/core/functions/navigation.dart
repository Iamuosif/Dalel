import 'package:go_router/go_router.dart';

void customNavigateReplacement(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void customNavigate(context, String path) {
  GoRouter.of(context).push(path);
}
