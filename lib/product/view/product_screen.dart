import 'package:flutter/material.dart';
import 'package:flutter_delivery/product/provider/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productProvider);

    return Center(
      child: const Text('프로덕트 탭'),
    );
  }
}
