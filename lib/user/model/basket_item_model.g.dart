// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasketItemModel _$$_BasketItemModelFromJson(Map<String, dynamic> json) =>
    _$_BasketItemModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_BasketItemModelToJson(_$_BasketItemModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'count': instance.count,
    };
