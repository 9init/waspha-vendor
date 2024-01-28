import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalculatesStartAndEndTimeNotifier
    extends StateNotifier<CalculateStartAndEndTime> {
  CalculatesStartAndEndTimeNotifier() : super(const CalculateStartAndEndTime());

  DateTime calculateEndDate(String interval) {
    DateTime now = DateTime.now();
    DateTime endTime;
    switch (interval) {
      case 'weekly':
        endTime = now.add(Duration(days: 7));
        state = state.copyWith(
          startTime: now.toUtc().toIso8601String(),
          endTime: endTime.toUtc().toIso8601String(),
        );

        break;
      case 'monthly':
        DateTime now = DateTime.now();
        debugPrint('The Date Time Now Is $now');
        DateTime localMonthlyStartDate = DateTime(now.year, now.month, 1, 12, 00);
        DateTime utcMonthlyStartDate = localMonthlyStartDate.toUtc();

        debugPrint('The Start Monthly Date Is $localMonthlyStartDate');
        debugPrint('The Start Monthly Date In Utc Is $utcMonthlyStartDate');

        DateTime convertedToLocalTime = utcMonthlyStartDate.toLocal();
        debugPrint('Converted back to Local Time: $convertedToLocalTime');
        int lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
        debugPrint('The Last Day Of Month is $lastDayOfMonth');
        endTime = DateTime(now.year, now.month, lastDayOfMonth, 23, 59, 59);
        state = state.copyWith(
          startTime: convertedToLocalTime.toUtc().toIso8601String(),
          endTime: endTime.toUtc().toIso8601String(),
        );
        break;
      case 'yearly':
        endTime = DateTime(now.year, 12, 31, 23, 59, 59);
        state = state.copyWith(
          startTime: now.toUtc().toIso8601String(),
          endTime: endTime.toUtc().toIso8601String(),
        );
        break;
      default:
        endTime = now;
        break;
    }
    return endTime;
  }
}

class CalculateStartAndEndTime {
  final String? startTime;
  final String? endTime;

  const CalculateStartAndEndTime({this.startTime, this.endTime});

  CalculateStartAndEndTime copyWith({String? startTime, String? endTime}) {
    return CalculateStartAndEndTime(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}

final welcomeNotifierProvider = StateNotifierProvider<
    CalculatesStartAndEndTimeNotifier, CalculateStartAndEndTime>(
  (ref) => CalculatesStartAndEndTimeNotifier(),
);
DateTime calculateMonthlyEndDate() {
  DateTime now = DateTime.now();
  int lastDay = DateTime(now.year, now.month + 1, 0).day;
  return DateTime(now.year, now.month, lastDay, 23, 59, 59);
}

DateTime calculateYearlyStartDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year, 1, 1);
}

DateTime calculateYearlyEndDate() {
  DateTime now = DateTime.now();
  return DateTime(now.year, 12, 31, 23, 59, 59);
}
DateTime calculateStartDate() {
  return DateTime.now();
}
