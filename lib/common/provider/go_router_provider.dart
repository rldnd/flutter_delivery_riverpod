import 'package:flutter_delivery/user/provider/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final provider = ref.watch(authProvider);
  return GoRouter(
    routes: provider.routes,
    redirect: provider.redirectLogic,
    initialLocation: '/splash',
    refreshListenable: provider,
  );
}
