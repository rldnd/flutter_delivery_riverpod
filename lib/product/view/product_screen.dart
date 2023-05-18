import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/component/pagination_list_view.dart';
import 'package:flutter_delivery/product/component/product_card.dart';
import 'package:flutter_delivery/product/model/product_model.dart';
import 'package:flutter_delivery/product/provider/product_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationListView<ProductModel>(
      provider: productProvider,
      itemBuilder: <ProductModel>(context, index, model) {
        return ProductCard.fromProductModel(model: model);
      },
    );
  }
}
