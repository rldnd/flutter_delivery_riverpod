import 'package:collection/collection.dart';
import 'package:flutter_delivery/product/model/product_model.dart';
import 'package:flutter_delivery/user/model/basket_item_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basket_provider.g.dart';

@Riverpod(keepAlive: true)
class Basket extends _$Basket {
  @override
  List<BasketItemModel> build() {
    return [];
  }

  Future<void> addToBasket({
    required ProductModel product,
  }) async {
    final exists =
        state.firstWhereOrNull((e) => e.product.id == product.id) != null;

    if (exists) {
      state = state
          .map((e) => e.product.id == product.id
              ? BasketItemModel(product: product, count: e.count + 1)
              : e)
          .toList();
    } else {
      state = [...state, BasketItemModel(product: product, count: 1)];
    }
  }

  Future<void> removeFromBasket({
    required ProductModel product,
    bool isDelete = false,
  }) async {
    final exists =
        state.firstWhereOrNull((e) => e.product.id == product.id) != null;
    if (!exists) return;

    final existingProduct =
        state.firstWhere((element) => element.product.id == product.id);

    if (existingProduct.count == 1 || isDelete) {
      state = state.where((e) => e.product.id != product.id).toList();
    } else {
      state = state
          .map((e) =>
              e.product.id == product.id ? e.copyWith(count: e.count - 1) : e)
          .toList();
    }
  }
}
