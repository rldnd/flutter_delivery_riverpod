// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$restaurantDetailHash() => r'da05035375a52cc1070022670ca82fd58155a11b';

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

typedef RestaurantDetailRef = AutoDisposeProviderRef<RestaurantModel?>;

/// See also [restaurantDetail].
@ProviderFor(restaurantDetail)
const restaurantDetailProvider = RestaurantDetailFamily();

/// See also [restaurantDetail].
class RestaurantDetailFamily extends Family<RestaurantModel?> {
  /// See also [restaurantDetail].
  const RestaurantDetailFamily();

  /// See also [restaurantDetail].
  RestaurantDetailProvider call({
    required String id,
  }) {
    return RestaurantDetailProvider(
      id: id,
    );
  }

  @override
  RestaurantDetailProvider getProviderOverride(
    covariant RestaurantDetailProvider provider,
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
  String? get name => r'restaurantDetailProvider';
}

/// See also [restaurantDetail].
class RestaurantDetailProvider extends AutoDisposeProvider<RestaurantModel?> {
  /// See also [restaurantDetail].
  RestaurantDetailProvider({
    required this.id,
  }) : super.internal(
          (ref) => restaurantDetail(
            ref,
            id: id,
          ),
          from: restaurantDetailProvider,
          name: r'restaurantDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$restaurantDetailHash,
          dependencies: RestaurantDetailFamily._dependencies,
          allTransitiveDependencies:
              RestaurantDetailFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is RestaurantDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
