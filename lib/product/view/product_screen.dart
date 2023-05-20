import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/component/pagination_list_view.dart';
import 'package:flutter_delivery/product/component/product_card.dart';
import 'package:flutter_delivery/product/provider/product_provider.dart';
import 'package:flutter_delivery/restaurant/view/restaurant_detail_screen.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: productProvider,
      itemBuilder: <ProductModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            context.goNamed(
              RestaurantDetailScreen.routeName,
              pathParameters: {'rid': model.restaurant.id},
            );
          },
          child: ProductCard.fromProductModel(model: model),
        );
      },
    );
  }
}
