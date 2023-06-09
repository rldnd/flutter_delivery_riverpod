import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/common/dio/dio.dart';
import 'package:flutter_delivery/common/model/cursor_pagination_model.dart';
import 'package:flutter_delivery/common/model/pagination_params.dart';
import 'package:flutter_delivery/common/repository/base_pagination_repository.dart';
import 'package:flutter_delivery/rating/model/rating_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'restaurant_rating_repository.g.dart';

@Riverpod(keepAlive: true)
RestaurantRatingRepository restaurantRatingRepository(
  RestaurantRatingRepositoryRef ref, {
  required String id,
}) {
  final dio = ref.watch(dioProvider);
  return RestaurantRatingRepository(
    dio,
    baseUrl: 'http://$ip/restaurant/$id/rating',
  );
}

@RestApi()
abstract class RestaurantRatingRepository
    implements BasePaginationRepository<RatingModel> {
  factory RestaurantRatingRepository(Dio dio, {String baseUrl}) =
      _RestaurantRatingRepository;

  @override
  @GET('/')
  @Headers({ACCESS_TOKEN_KEY: true})
  Future<CursorPagination<RatingModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
