import 'package:freezed_annotation/freezed_annotation.dart';

part 'cursor_pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CursorPagination<T> {
  final CursorPaginationMeta meta;
  final List<T> data;

  const CursorPagination({
    required this.meta,
    required this.data,
  });

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class CursorPaginationMeta {
  final int count;
  final bool hasMore;

  const CursorPaginationMeta({
    required this.count,
    required this.hasMore,
  });

  factory CursorPaginationMeta.fromJson(Map<String, Object?> json) =>
      _$CursorPaginationMetaFromJson(json);
}
