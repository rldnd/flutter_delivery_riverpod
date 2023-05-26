import 'package:flutter/foundation.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_product_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_delivery/common/utils/data_utils.dart';

part 'restaurant_detail_model.g.dart';

@immutable
@JsonSerializable()
final class RestaurantDetailModel extends RestaurantModel {
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

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDetailModelToJson(this);
}
