import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/layout/default_layout.dart';

class RootTab extends StatelessWidget {
  const RootTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: Text('hi'));
  }
}
