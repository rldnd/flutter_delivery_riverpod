import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_detail_model.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // @GET('/')
  // paginate();

  @GET('/{id}')
  @Headers({ACCESS_TOKEN_KEY: true})
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path() required String id,
  });
}
