import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/layout/default_layout.dart';
import 'package:flutter_delivery/product/component/product_card.dart';
import 'package:flutter_delivery/restaurant/component/restaurant_card.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_product_model.dart';
import 'package:flutter_delivery/restaurant/provider/restaurant_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  final String id;

  const RestaurantDetailScreen({
    required this.id,
    super.key,
  });

  @override
  ConsumerState<RestaurantDetailScreen> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends ConsumerState<RestaurantDetailScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantDetailProvider(id: widget.id));

    if (state == null) {
      return const DefaultLayout(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return DefaultLayout(
      title: state.name,
      child: CustomScrollView(
        slivers: [
          renderTop(model: state),
          if (state is RestaurantDetailModel) renderLabel(),
          if (state is RestaurantDetailModel)
            renderProducts(models: state.products),
        ],
      ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts({required List<RestaurantProductModel> models}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: models.length,
          (context, index) => Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ProductCard.fromRestaurantProductModel(
              model: models[index],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop({required RestaurantModel model}) {
    return SliverToBoxAdapter(
      child: RestaurantCard.fromRestaurantModel(
        model: model,
        isDetail: true,
      ),
    );
  }
}
