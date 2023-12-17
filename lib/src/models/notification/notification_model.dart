import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required String title,
    required String body,
    @JsonKey(name: 'extra_data') ExtraData? extraData,
    required String type,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'is_viewed') required bool isViewed,
    @JsonKey(name: 'template_id') required int templateId,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

@freezed
abstract class ExtraData with _$ExtraData {
  const factory ExtraData({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'sent_by') SentBy? sentBy,
  }) = _ExtraData;

  factory ExtraData.fromJson(dynamic json) =>
      _$ExtraDataFromJson(jsonDecode(json));
}

@freezed
abstract class SentBy with _$SentBy {
  const factory SentBy({
    required String? name,
    required String? avatar,
  }) = _SentBy;

  factory SentBy.fromJson(Map<String, dynamic> json) => _$SentByFromJson(json);
}
