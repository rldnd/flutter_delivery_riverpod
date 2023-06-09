import 'package:flutter/foundation.dart';
import 'package:flutter_delivery/common/model/model_with_id.dart';
import 'package:flutter_delivery/common/utils/data_utils.dart';
import 'package:flutter_delivery/user/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@immutable
@JsonSerializable()
final class RatingModel implements ModelWithId {
  @override
  final String id;
  final UserModel user;
  final int rating;
  final String content;
  @JsonKey(fromJson: DataUtils.listPathsToUrls)
  final List<String> imgUrls;

  const RatingModel({
    required this.id,
    required this.user,
    required this.rating,
    required this.content,
    required this.imgUrls,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}
