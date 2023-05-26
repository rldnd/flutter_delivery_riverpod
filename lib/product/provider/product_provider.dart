import 'package:flutter_delivery/common/model/cursor_pagination_model.dart';
import 'package:flutter_delivery/common/provider/pagination_provider.dart';
import 'package:flutter_delivery/product/model/product_model.dart';
import 'package:flutter_delivery/product/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider =
    StateNotifierProvider<ProductStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductStateNotifier(repository: repository);
});

final class ProductStateNotifier
    extends PaginationProvider<ProductModel, ProductRepository> {
  ProductStateNotifier({required super.repository});
}
