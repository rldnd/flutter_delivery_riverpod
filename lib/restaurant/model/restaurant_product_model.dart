import 'package:flutter_delivery/common/constant/data.dart';

class RestaurantProductModel {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  const RestaurantProductModel({
    required this.detail,
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.price,
  });

  factory RestaurantProductModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantProductModel(
      detail: json['detail'],
      id: json['id'],
      imgUrl: 'http://$ip${json['imgUrl']}',
      name: json['name'],
      price: json['price'],
    );
  }
}
