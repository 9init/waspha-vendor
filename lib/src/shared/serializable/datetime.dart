import 'package:json_annotation/json_annotation.dart';

class DateTimeSerializer implements JsonConverter<DateTime, dynamic> {
  const DateTimeSerializer();

  @override
  DateTime fromJson(dynamic date) => DateTime.parse(date);

  @override
  String toJson(DateTime date) => date.toIso8601String();
}
