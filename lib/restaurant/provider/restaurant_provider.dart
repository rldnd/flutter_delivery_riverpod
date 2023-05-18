import 'package:collection/collection.dart';
import 'package:flutter_delivery/common/model/cursor_pagination_model.dart';
import 'package:flutter_delivery/common/provider/pagination_provider.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:flutter_delivery/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'restaurant_provider.g.dart';

@riverpod
RestaurantModel? restaurantDetail(
  RestaurantDetailRef ref, {
  required String id,
}) {
  final state = ref.watch(restaurantProvider);

  if (state is! CursorPagination) return null;

  return state.data.firstWhereOrNull((element) => element.id == id);
}

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>(
  (ref) {
    final repository = ref.watch(restaurantRepositoryProvider);
    return RestaurantStateNotifier(repository: repository);
  },
);

class RestaurantStateNotifier
    extends PaginationProvider<RestaurantModel, RestaurantRepository> {
  RestaurantStateNotifier({required super.repository});

  Future<void> getDetail({
    required String id,
  }) async {
    if (state is! CursorPagination) await paginate();

    if (state is! CursorPagination) return;

    final pState = state as CursorPagination;
    final response = await repository.getRestaurantDetail(id: id);

    if (pState.data.where((item) => item.id == id).isEmpty) {
      state =
          pState.copyWith(data: <RestaurantModel>[...pState.data, response]);
    } else {
      state = pState.copyWith(
        data: pState.data
            .map<RestaurantModel>((item) => item.id == id ? response : item)
            .toList(),
      );
    }
  }
}
