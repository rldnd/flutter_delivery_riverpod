import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/common/secure_storage/secure_storage.dart';
import 'package:flutter_delivery/common/view/root_tab.dart';
import 'package:flutter_delivery/common/view/splash_screen.dart';
import 'package:flutter_delivery/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter_delivery/user/provider/user_me_provider.dart';
import 'package:flutter_delivery/user/view/login_screen.dart';
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

  FutureOr<String?> redirectLogic(
      BuildContext context, GoRouterState state) async {
    final me = ref.read(userMeProvider);
    final storage = ref.read(secureStorageProvider);
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final loggingIn = state.location == '/login';
    final isSplash = state.location == '/splash';

    if (me is AsyncData) {
      if (me.value == null) {
        return loggingIn
            ? null
            : refreshToken == null
                ? '/login'
                : null;
      } else {
        return loggingIn || isSplash ? '/' : null;
      }
    }

    if (me is AsyncError) {
      return !loggingIn ? '/login' : null;
    }

    return null;
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: RootTab.routeName,
          builder: (_, __) => const RootTab(),
          routes: [
            GoRoute(
              path: 'restaurant/:rid',
              name: RestaurantDetailScreen.routeName,
              builder: (_, state) => RestaurantDetailScreen(
                id: state.pathParameters['rid']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (_, __) => const SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.routeName,
          builder: (_, __) => const LoginScreen(),
        ),
      ];
}
