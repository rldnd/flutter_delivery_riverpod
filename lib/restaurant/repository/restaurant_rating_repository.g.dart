// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_rating_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestaurantRatingRepository implements RestaurantRatingRepository {
  _RestaurantRatingRepository(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CursorPagination<RatingModel>> paginate(
      {paginationParams = const PaginationParams()}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(paginationParams?.toJson() ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'ACCESS_TOKEN': true};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CursorPagination<RatingModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CursorPagination<RatingModel>.fromJson(
      _result.data!,
      (json) => RatingModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$restaurantRatingRepositoryHash() =>
    r'c7f477cf5c85f47ca3e8ad1a548b82b4aecb7d3d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef RestaurantRatingRepositoryRef = ProviderRef<RestaurantRatingRepository>;

/// See also [restaurantRatingRepository].
@ProviderFor(restaurantRatingRepository)
const restaurantRatingRepositoryProvider = RestaurantRatingRepositoryFamily();

/// See also [restaurantRatingRepository].
class RestaurantRatingRepositoryFamily
    extends Family<RestaurantRatingRepository> {
  /// See also [restaurantRatingRepository].
  const RestaurantRatingRepositoryFamily();

  /// See also [restaurantRatingRepository].
  RestaurantRatingRepositoryProvider call({
    required String id,
  }) {
    return RestaurantRatingRepositoryProvider(
      id: id,
    );
  }

  @override
  RestaurantRatingRepositoryProvider getProviderOverride(
    covariant RestaurantRatingRepositoryProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'restaurantRatingRepositoryProvider';
}

/// See also [restaurantRatingRepository].
class RestaurantRatingRepositoryProvider
    extends Provider<RestaurantRatingRepository> {
  /// See also [restaurantRatingRepository].
  RestaurantRatingRepositoryProvider({
    required this.id,
  }) : super.internal(
          (ref) => restaurantRatingRepository(
            ref,
            id: id,
          ),
          from: restaurantRatingRepositoryProvider,
          name: r'restaurantRatingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$restaurantRatingRepositoryHash,
          dependencies: RestaurantRatingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              RestaurantRatingRepositoryFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is RestaurantRatingRepositoryProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
