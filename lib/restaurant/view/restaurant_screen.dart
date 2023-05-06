import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {'authorization': 'Bearer $accessToken'},
      ),
    );

    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder<List>(
          future: paginateRestaurant(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            return ListView.separated(
              itemBuilder: (_, index) {
                final item = snapshot.data![index];

                return RestaurantCard(
                  image: Image.network(
                    'http://$ip${item['thumbUrl']}',
                    fit: BoxFit.cover,
                  ),
                  name: item['name'],
                  tags: List<String>.from(item['tags']),
                  deliveryFee: item['deliveryFee'],
                  deliveryTime: item['deliveryTime'],
                  ratings: item['ratings'],
                  ratingsCount: item['ratingsCount'],
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
