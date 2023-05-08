import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:flutter_delivery/restaurant/repository/restaurant_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'restaurant_provider.g.dart';

@Riverpod(keepAlive: true)
class RestaurantNotifier extends _$RestaurantNotifier {
  @override
  FutureOr<List<RestaurantModel>> build() {
    paginate();
    return [];
  }

  paginate() async {
    final repository = ref.read(restaurantRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => repository.paginate().then((value) => value.data),
    );
  }
}
