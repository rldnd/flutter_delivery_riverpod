import 'package:flutter/material.dart';
import 'package:flutter_delivery/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RestaurantCard(
            image: Image.asset(
              'asset/image/food/ddeok_bok_gi.jpg',
              fit: BoxFit.cover,
            ),
            name: '불타는 떡볶이',
            tags: ['떡볶이', '치즈', '매운맛'],
            deliveryFee: 2000,
            deliveryTime: 15,
            rating: 4.52,
            ratingCount: 100,
          ),
        ),
      ),
    );
  }
}
