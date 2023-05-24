import 'package:flutter_delivery/product/model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_item_model.g.dart';
part 'basket_item_model.freezed.dart';

@freezed
class BasketItemModel with _$BasketItemModel {
  const factory BasketItemModel({
    required ProductModel product,
    required int count,
  }) = _BasketItemModel;

  factory BasketItemModel.fromJson(Map<String, dynamic> json) =>
      _$BasketItemModelFromJson(json);
}
