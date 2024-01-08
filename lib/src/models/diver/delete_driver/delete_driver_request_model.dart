import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_driver_request_model.g.dart';
@JsonSerializable(explicitToJson: true)
class DeleteDriverRequestModel  {
  final String id;

  const DeleteDriverRequestModel({
    required this.id,
  });

  Map<String, dynamic> toJson() => _$DeleteDriverRequestModelToJson(this);
}

