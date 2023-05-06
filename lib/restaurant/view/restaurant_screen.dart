import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/common/dio/dio.dart';
import 'package:flutter_delivery/restaurant/component/restaurant_card.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:flutter_delivery/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_delivery/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List<RestaurantModel>> paginateRestaurant() async {
    final dio = Dio();
    dio.interceptors.add(const CustomInterceptor(storage: storage));

    final response = await RestaurantRepository(
      dio,
      baseUrl: 'http://$ip/restaurant',
    ).paginate();

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder<List<RestaurantModel>>(
          future: paginateRestaurant(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            return ListView.separated(
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => RestaurantDetailScreen(
                          id: snapshot.data![index].id,
                        ),
                      ),
                    );
                  },
                  child: RestaurantCard.fromRestaurantModel(
                    model: snapshot.data![index],
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const SizedBox(height: 16.0);
              },
              itemCount: snapshot.data!.length,
            );
          },
        ),
      ),
    );
  }
}
