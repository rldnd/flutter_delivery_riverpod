import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_product_model.g.dart';

@immutable
@JsonSerializable()
class RestaurantProductModel {
  final String id;
  final String name;
  @JsonKey(fromJson: DataUtils.pathToUrl)
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

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantProductModelFromJson(json);
}
