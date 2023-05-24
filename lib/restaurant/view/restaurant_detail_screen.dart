import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/colors.dart';
import 'package:flutter_delivery/common/layout/default_layout.dart';
import 'package:flutter_delivery/common/model/cursor_pagination_model.dart';
import 'package:flutter_delivery/common/utils/pagination_utils.dart';
import 'package:flutter_delivery/product/component/product_card.dart';
import 'package:flutter_delivery/product/model/product_model.dart';
import 'package:flutter_delivery/rating/component/rating_card.dart';
import 'package:flutter_delivery/rating/model/rating_model.dart';
import 'package:flutter_delivery/restaurant/component/restaurant_card.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_product_model.dart';
import 'package:flutter_delivery/restaurant/provider/restaurant_provider.dart';
import 'package:flutter_delivery/restaurant/provider/restaurant_rating_provider.dart';
import 'package:flutter_delivery/user/provider/basket_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'restaurantDetail';

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
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
    controller.addListener(scrollListener);
  }

  void scrollListener() {
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(restaurantRatingProvider(widget.id).notifier),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantDetailProvider(id: widget.id));
    final ratingsState = ref.watch(restaurantRatingProvider(widget.id));
    final basket = ref.watch(basketProvider);

    if (state == null) {
      return const DefaultLayout(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return DefaultLayout(
      title: state.name,
      floatingActionButton: FloatingActionButton(
        backgroundColor: C_PRIMARY,
        onPressed: () {},
        child: Badge(
          backgroundColor: Colors.white,
          isLabelVisible: basket.isNotEmpty,
          label: Text(
            basket.fold<int>(0, (acc, cur) => acc + cur.count).toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          child: Icon(Icons.shopping_basket_outlined),
        ),
      ),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          renderTop(model: state),
          if (state is! RestaurantDetailModel) renderLoading(),
          if (state is RestaurantDetailModel) renderLabel(),
          if (state is RestaurantDetailModel)
            renderProducts(models: state.products, restaurant: state),
          if (ratingsState is CursorPagination<RatingModel>)
            renderRatings(models: ratingsState.data)
        ],
      ),
    );
  }

  SliverPadding renderRatings({required List<RatingModel> models}) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RatingCard.fromRatingModel(model: models[index]),
          ),
          childCount: models.length,
        ),
      ),
    );
  }

  SliverPadding renderLoading() {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: SkeletonParagraph(
                style: const SkeletonParagraphStyle(
                  lines: 5,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
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

  SliverPadding renderProducts({
    required List<RestaurantProductModel> models,
    required RestaurantModel restaurant,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(childCount: models.length,
            (context, index) {
          final model = models[index];

          return InkWell(
            onTap: () {
              ref.read(basketProvider.notifier).addToBasket(
                    product: ProductModel(
                      id: model.id,
                      name: model.name,
                      detail: model.detail,
                      imgUrl: model.imgUrl,
                      price: model.price,
                      restaurant: restaurant,
                    ),
                  );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard.fromRestaurantProductModel(
                model: models[index],
              ),
            ),
          );
        }),
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
