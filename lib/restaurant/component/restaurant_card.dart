import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/common/constant/colors.dart';

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

  const RestaurantCard({
    required this.deliveryFee,
    required this.deliveryTime,
    required this.image,
    required this.name,
    required this.ratings,
    required this.ratingsCount,
    required this.tags,
    super.key,
  });

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
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: image,
        ),
        const SizedBox(height: 16.0),
        Column(
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
            )
          ],
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
