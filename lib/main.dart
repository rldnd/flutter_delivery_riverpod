import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/colors.dart';
import 'package:flutter_delivery/common/provider/go_router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: _App()));
}

class _App extends ConsumerWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'NotoSans',
        useMaterial3: true,
        colorSchemeSeed: C_PRIMARY,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
