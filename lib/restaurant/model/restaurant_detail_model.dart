import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_product_model.dart';

class RestaurantDetailModel extends RestaurantModel {
  /// 상세 내용
  final String detail;

  /// 제품 정보 리스트
  final List<RestaurantProductModel> products;

  const RestaurantDetailModel({
    required super.deliveryFee,
    required super.deliveryTime,
    required super.id,
    required super.name,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.tags,
    required super.thumbUrl,
    required this.detail,
    required this.products,
  });

  factory RestaurantDetailModel.fromJson({required Map<String, dynamic> json}) {
    return RestaurantDetailModel(
      deliveryFee: json['deliveryFee'],
      deliveryTime: json['deliveryTime'],
      id: json['id'],
      name: json['name'],
      priceRange: RestaurantPriceRange.values.firstWhere(
        (range) => range.name == json['priceRange'],
      ),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      tags: List<String>.from(json['tags']),
      thumbUrl: json['thumbUrl'],
      detail: json['detail'],
      products: json['products']
          .map<RestaurantProductModel>(
            (product) => RestaurantProductModel.fromJson(
              json: product,
            ),
          )
          .toList(),
    );
  }
}
