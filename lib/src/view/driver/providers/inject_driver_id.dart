import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class InjectDriverId extends StateNotifier<String> {
  InjectDriverId() : super('');

  void setDriverId({required String driverId}) {
    state =driverId;
    debugPrint('The InjectDriver id Is $state');
  }

}



final injectDriverIdProvider = StateNotifierProvider<InjectDriverId, String>((ref) => InjectDriverId());
