enum RestaurantPriceRange { expensive, medium, cheap }

class RestaurantModel {
  final String id;

  /// 이름
  final String name;

  /// 썸네일 주소
  final String thumbUrl;

  /// 태그들
  final List<String> tags;

  /// 가격 정도
  final RestaurantPriceRange priceRange;

  /// 평점
  final double ratings;

  /// 평점 갯수
  final int ratingsCount;

  /// 배달 시간
  final int deliveryTime;

  /// 배달료
  final int deliveryFee;

  const RestaurantModel({
    required this.deliveryFee,
    required this.deliveryTime,
    required this.id,
    required this.name,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.tags,
    required this.thumbUrl,
  });
}
