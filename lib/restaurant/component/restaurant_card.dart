import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/colors.dart';
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter_delivery/restaurant/model/restaurant_model.dart';

class IconTextData {
  final IconData icon;
  final String label;

  IconTextData({
    required this.icon,
    required this.label,
  });
}

class RestaurantCard extends StatelessWidget {
  /// 이미지
  final Widget image;

  /// 레스토랑 이름
  final String name;

  /// 태그들
  final List<String> tags;

  /// 평점 갯수
  final int ratingsCount;

  /// 배송 걸리는 시간
  final int deliveryTime;

  /// 배송 비용
  final int deliveryFee;

  /// 평균 평점
  final double ratings;

  /// 상세 페이지 여부
  final bool isDetail;

  /// 상세 내용
  final String? detail;

  const RestaurantCard({
    required this.deliveryFee,
    required this.deliveryTime,
    required this.image,
    required this.name,
    required this.ratings,
    required this.ratingsCount,
    required this.tags,
    this.isDetail = false,
    this.detail,
    super.key,
  });

  factory RestaurantCard.fromRestaurantModel({
    required RestaurantModel model,
    bool isDetail = false,
    String? detail,
  }) {
    return RestaurantCard(
      deliveryFee: model.deliveryFee,
      deliveryTime: model.deliveryTime,
      image: Image.network(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      ratings: model.ratings,
      ratingsCount: model.ratingsCount,
      tags: model.tags,
      isDetail: isDetail,
      detail: model is RestaurantDetailModel ? model.detail : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconTextData = [
      IconTextData(
        icon: Icons.star,
        label: ratings.toString(),
      ),
      IconTextData(
        icon: Icons.receipt,
        label: ratingsCount.toString(),
      ),
      IconTextData(
        icon: Icons.timelapse_outlined,
        label: '$deliveryTime분',
      ),
      IconTextData(
        icon: Icons.monetization_on,
        label: deliveryFee == 0 ? '무료' : '$deliveryFee원',
      ),
    ];

    return Column(
      children: [
        if (isDetail) image,
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: image,
          ),
        const SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16.0 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                tags.join(' · '),
                style: const TextStyle(
                  color: C_BODY_TEXT,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: iconTextData.mapIndexed(
                  (index, data) {
                    if (index != iconTextData.length - 1) {
                      return Row(
                        children: [
                          _IconText(icon: data.icon, label: data.label),
                          renderDot(),
                        ],
                      );
                    }

                    return _IconText(icon: data.icon, label: data.label);
                  },
                ).toList(),
              ),
              if (detail != null && isDetail)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(detail!),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: C_PRIMARY,
          size: 14.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
