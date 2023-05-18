import 'package:flutter_delivery/common/model/model_with_id.dart';
import 'package:flutter_delivery/common/utils/data_utils.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel implements ModelWithId {
  const factory ProductModel({
    required String id,
    required String name,
    required String detail,
    @JsonKey(fromJson: DataUtils.pathToUrl) required String imgUrl,
    required int price,
    required RestaurantModel restaurant,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
