import 'package:flutter_delivery/common/model/cursor_pagination_model.dart';
import 'package:flutter_delivery/common/provider/pagination_provider.dart';
import 'package:flutter_delivery/rating/model/rating_model.dart';
import 'package:flutter_delivery/restaurant/repository/restaurant_rating_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantRatingProvider = StateNotifierProvider.family<
    RestaurantRatingStateNotifier, CursorPaginationBase, String>(
  (ref, id) {
    final repository = ref.watch(RestaurantRatingRepositoryProvider(id: id));
    return RestaurantRatingStateNotifier(repository: repository);
  },
);

class RestaurantRatingStateNotifier
    extends PaginationProvider<RatingModel, RestaurantRatingRepository> {
  RestaurantRatingStateNotifier({required super.repository});
}
