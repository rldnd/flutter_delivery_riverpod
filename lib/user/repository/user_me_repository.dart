import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/common/dio/dio.dart';
import 'package:flutter_delivery/user/model/basket_item_model.dart';
import 'package:flutter_delivery/user/model/update_basket_body.dart';
import 'package:flutter_delivery/user/model/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_me_repository.g.dart';

@Riverpod(keepAlive: true)
UserMeRepository userMeRepository(UserMeRepositoryRef ref) {
  final dio = ref.watch(dioProvider);

  return UserMeRepository(dio, baseUrl: 'http://$ip/user/me');
}

@RestApi()
abstract class UserMeRepository {
  factory UserMeRepository(Dio dio, {String? baseUrl}) = _UserMeRepository;

  @GET('/')
  @Headers({ACCESS_TOKEN_KEY: true})
  Future<UserModel> getMe();

  @GET('/basket')
  @Headers({ACCESS_TOKEN_KEY: true})
  Future<List<BasketItemModel>> getBasket();

  @PATCH('/basket')
  @Headers({ACCESS_TOKEN_KEY: true})
  Future<List<BasketItemModel>> updateBasket({
    @Body() required UpdateBasketBody body,
  });
}
