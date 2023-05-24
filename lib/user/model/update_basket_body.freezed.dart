// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_basket_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateBasketBody {
  String get productId => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateBasketBodyCopyWith<UpdateBasketBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBasketBodyCopyWith<$Res> {
  factory $UpdateBasketBodyCopyWith(
          UpdateBasketBody value, $Res Function(UpdateBasketBody) then) =
      _$UpdateBasketBodyCopyWithImpl<$Res, UpdateBasketBody>;
  @useResult
  $Res call({String productId, int count});
}

/// @nodoc
class _$UpdateBasketBodyCopyWithImpl<$Res, $Val extends UpdateBasketBody>
    implements $UpdateBasketBodyCopyWith<$Res> {
  _$UpdateBasketBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateBasketBodyCopyWith<$Res>
    implements $UpdateBasketBodyCopyWith<$Res> {
  factory _$$_UpdateBasketBodyCopyWith(
          _$_UpdateBasketBody value, $Res Function(_$_UpdateBasketBody) then) =
      __$$_UpdateBasketBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productId, int count});
}

/// @nodoc
class __$$_UpdateBasketBodyCopyWithImpl<$Res>
    extends _$UpdateBasketBodyCopyWithImpl<$Res, _$_UpdateBasketBody>
    implements _$$_UpdateBasketBodyCopyWith<$Res> {
  __$$_UpdateBasketBodyCopyWithImpl(
      _$_UpdateBasketBody _value, $Res Function(_$_UpdateBasketBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? count = null,
  }) {
    return _then(_$_UpdateBasketBody(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UpdateBasketBody implements _UpdateBasketBody {
  const _$_UpdateBasketBody({required this.productId, required this.count});

  @override
  final String productId;
  @override
  final int count;

  @override
  String toString() {
    return 'UpdateBasketBody(productId: $productId, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateBasketBody &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateBasketBodyCopyWith<_$_UpdateBasketBody> get copyWith =>
      __$$_UpdateBasketBodyCopyWithImpl<_$_UpdateBasketBody>(this, _$identity);
}

abstract class _UpdateBasketBody implements UpdateBasketBody {
  const factory _UpdateBasketBody(
      {required final String productId,
      required final int count}) = _$_UpdateBasketBody;

  @override
  String get productId;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateBasketBodyCopyWith<_$_UpdateBasketBody> get copyWith =>
      throw _privateConstructorUsedError;
}
