import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/component/pagination_list_view.dart';
import 'package:flutter_delivery/restaurant/component/restaurant_card.dart';
import 'package:flutter_delivery/restaurant/provider/restaurant_provider.dart';
import 'package:flutter_delivery/restaurant/view/restaurant_detail_screen.dart';
import 'package:go_router/go_router.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            context.goNamed(
              RestaurantDetailScreen.routeName,
              pathParameters: {'rid': model.id},
            );
          },
          child: RestaurantCard.fromRestaurantModel(model: model),
        );
      },
    );
  }
}
