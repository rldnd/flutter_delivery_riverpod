// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasketItemModel _$BasketItemModelFromJson(Map<String, dynamic> json) {
  return _BasketItemModel.fromJson(json);
}

/// @nodoc
mixin _$BasketItemModel {
  ProductModel get product => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasketItemModelCopyWith<BasketItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketItemModelCopyWith<$Res> {
  factory $BasketItemModelCopyWith(
          BasketItemModel value, $Res Function(BasketItemModel) then) =
      _$BasketItemModelCopyWithImpl<$Res, BasketItemModel>;
  @useResult
  $Res call({ProductModel product, int count});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$BasketItemModelCopyWithImpl<$Res, $Val extends BasketItemModel>
    implements $BasketItemModelCopyWith<$Res> {
  _$BasketItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BasketItemModelCopyWith<$Res>
    implements $BasketItemModelCopyWith<$Res> {
  factory _$$_BasketItemModelCopyWith(
          _$_BasketItemModel value, $Res Function(_$_BasketItemModel) then) =
      __$$_BasketItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductModel product, int count});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$_BasketItemModelCopyWithImpl<$Res>
    extends _$BasketItemModelCopyWithImpl<$Res, _$_BasketItemModel>
    implements _$$_BasketItemModelCopyWith<$Res> {
  __$$_BasketItemModelCopyWithImpl(
      _$_BasketItemModel _value, $Res Function(_$_BasketItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? count = null,
  }) {
    return _then(_$_BasketItemModel(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasketItemModel implements _BasketItemModel {
  const _$_BasketItemModel({required this.product, required this.count});

  factory _$_BasketItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_BasketItemModelFromJson(json);

  @override
  final ProductModel product;
  @override
  final int count;

  @override
  String toString() {
    return 'BasketItemModel(product: $product, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasketItemModel &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasketItemModelCopyWith<_$_BasketItemModel> get copyWith =>
      __$$_BasketItemModelCopyWithImpl<_$_BasketItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasketItemModelToJson(
      this,
    );
  }
}

abstract class _BasketItemModel implements BasketItemModel {
  const factory _BasketItemModel(
      {required final ProductModel product,
      required final int count}) = _$_BasketItemModel;

  factory _BasketItemModel.fromJson(Map<String, dynamic> json) =
      _$_BasketItemModel.fromJson;

  @override
  ProductModel get product;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_BasketItemModelCopyWith<_$_BasketItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
