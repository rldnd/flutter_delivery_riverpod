import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/colors.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_product_model.dart';

class ProductCard extends StatelessWidget {
  final Image image;
  final String name;
  final String detail;
  final int price;

  const ProductCard({
    required this.name,
    required this.image,
    required this.detail,
    required this.price,
    super.key,
  });

  factory ProductCard.fromRestaurantProductModel({
    required RestaurantProductModel model,
  }) {
    return ProductCard(
      name: model.name,
      image: Image.network(
        model.imgUrl,
        width: 110.0,
        height: 110.0,
        fit: BoxFit.cover,
      ),
      detail: model.detail,
      price: model.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: image,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  detail,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: C_BODY_TEXT,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  price.toString(),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: C_PRIMARY,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
