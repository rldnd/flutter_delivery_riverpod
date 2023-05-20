import 'package:flutter/material.dart';
import 'package:flutter_delivery/user/provider/user_me_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          ref.read(userMeProvider.notifier).logout();
        },
        child: const Text('로그이웃'),
      ),
    );
  }
}
