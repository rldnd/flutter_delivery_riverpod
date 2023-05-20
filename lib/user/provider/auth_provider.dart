import 'package:flutter/widgets.dart';
import 'package:flutter_delivery/user/provider/user_me_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>(
  (ref) => AuthProvider(ref: ref),
);

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({required this.ref}) {
    ref.listen(userMeProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final me = ref.read(userMeProvider);
    final loggingIn = state.location == '/login';

    if (me == const AsyncData(null)) {
      return loggingIn ? null : '/login';
    }

    if (me is AsyncData) {
      return loggingIn || state.location == '/splash' ? '/' : null;
    }

    if (me is AsyncError) {
      return !loggingIn ? '/login' : null;
    }

    return null;
  }
}
