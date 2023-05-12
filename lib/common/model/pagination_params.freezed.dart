// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationParams _$PaginationParamsFromJson(Map<String, dynamic> json) {
  return _PaginationParams.fromJson(json);
}

/// @nodoc
mixin _$PaginationParams {
  String? get after => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationParamsCopyWith<PaginationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationParamsCopyWith<$Res> {
  factory $PaginationParamsCopyWith(
          PaginationParams value, $Res Function(PaginationParams) then) =
      _$PaginationParamsCopyWithImpl<$Res, PaginationParams>;
  @useResult
  $Res call({String? after, int? count});
}

/// @nodoc
class _$PaginationParamsCopyWithImpl<$Res, $Val extends PaginationParams>
    implements $PaginationParamsCopyWith<$Res> {
  _$PaginationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? after = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      after: freezed == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationParamsCopyWith<$Res>
    implements $PaginationParamsCopyWith<$Res> {
  factory _$$_PaginationParamsCopyWith(
          _$_PaginationParams value, $Res Function(_$_PaginationParams) then) =
      __$$_PaginationParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? after, int? count});
}

/// @nodoc
class __$$_PaginationParamsCopyWithImpl<$Res>
    extends _$PaginationParamsCopyWithImpl<$Res, _$_PaginationParams>
    implements _$$_PaginationParamsCopyWith<$Res> {
  __$$_PaginationParamsCopyWithImpl(
      _$_PaginationParams _value, $Res Function(_$_PaginationParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? after = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_PaginationParams(
      after: freezed == after
          ? _value.after
          : after // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationParams implements _PaginationParams {
  const _$_PaginationParams({this.after, this.count});

  factory _$_PaginationParams.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationParamsFromJson(json);

  @override
  final String? after;
  @override
  final int? count;

  @override
  String toString() {
    return 'PaginationParams(after: $after, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationParams &&
            (identical(other.after, after) || other.after == after) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, after, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationParamsCopyWith<_$_PaginationParams> get copyWith =>
      __$$_PaginationParamsCopyWithImpl<_$_PaginationParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationParamsToJson(
      this,
    );
  }
}

abstract class _PaginationParams implements PaginationParams {
  const factory _PaginationParams({final String? after, final int? count}) =
      _$_PaginationParams;

  factory _PaginationParams.fromJson(Map<String, dynamic> json) =
      _$_PaginationParams.fromJson;

  @override
  String? get after;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationParamsCopyWith<_$_PaginationParams> get copyWith =>
      throw _privateConstructorUsedError;
}
