import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/component/pagination_list_view.dart';
import 'package:flutter_delivery/product/component/product_card.dart';
import 'package:flutter_delivery/product/provider/product_provider.dart';
import 'package:flutter_delivery/restaurant/view/restaurant_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: productProvider,
      itemBuilder: <ProductModel>(context, index, model) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RestaurantDetailScreen(id: model.restaurant.id),
              ),
            );
          },
          child: ProductCard.fromProductModel(model: model),
        );
      },
    );
  }
}
