import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetDriverContactDataProvider extends StateNotifier<DriverContactState> {
  GetDriverContactDataProvider() : super(DriverContactState());

  void setDriverContact(String name, String mobileNumber) {
    state = DriverContactState(
      driverName: name,
      driverMobileNumber: mobileNumber,
    );
  }
  void setDriverCountryCode({String? countryCode}) {
   state.countryCode =countryCode??'';
   debugPrint('The Country Code Is $countryCode');
   debugPrint('The Country Code Is ${state.countryCode}');
  }
}

class DriverContactState {
  String driverName;
  String driverMobileNumber;
  String countryCode;

  DriverContactState(
      {this.driverName = '',
      this.driverMobileNumber = '',
      this.countryCode = ''});
}

final getDriverContactDataProvider = AutoDisposeStateNotifierProvider<
    GetDriverContactDataProvider,
    DriverContactState>((ref) => GetDriverContactDataProvider());
