// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantProductModel _$RestaurantProductModelFromJson(
        Map<String, dynamic> json) =>
    RestaurantProductModel(
      detail: json['detail'] as String,
      id: json['id'] as String,
      imgUrl: DataUtils.pathToUrl(json['imgUrl'] as String),
      name: json['name'] as String,
      price: json['price'] as int,
    );

Map<String, dynamic> _$RestaurantProductModelToJson(
        RestaurantProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'detail': instance.detail,
      'price': instance.price,
    };
