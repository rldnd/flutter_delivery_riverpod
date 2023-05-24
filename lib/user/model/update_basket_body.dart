import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_basket_body.freezed.dart';

@freezed
class UpdateBasketBody with _$UpdateBasketBody {
  const factory UpdateBasketBody({
    required String productId,
    required int count,
  }) = _UpdateBasketBody;
}
