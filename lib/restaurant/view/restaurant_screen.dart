import 'package:flutter/material.dart';
import 'package:flutter_delivery/restaurant/component/restaurant_card.dart';
import 'package:flutter_delivery/restaurant/provider/restaurant_provider.dart';
import 'package:flutter_delivery/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantNotifierProvider);

    return data.when(
      loading: () => const CircularProgressIndicator(),
      data: (data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RestaurantDetailScreen(
                      id: data[index].id,
                    ),
                  ),
                );
              },
              child: RestaurantCard.fromRestaurantModel(
                model: data[index],
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(height: 16.0);
          },
          itemCount: data.length,
        ),
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
