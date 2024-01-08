import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetDriverContactDataProvider extends StateNotifier<DriverContactState> {
  GetDriverContactDataProvider() : super(DriverContactState());

  void setDriverContact(String name, String mobileNumber) {
    state =
        DriverContactState(driverName: name, driverMobileNumber: mobileNumber);
  }
}

class DriverContactState {
  String driverName;
  String driverMobileNumber;

  DriverContactState({this.driverName = '', this.driverMobileNumber = ''});
}

final getDriverContactDataProvider = AutoDisposeStateNotifierProvider<
    GetDriverContactDataProvider,
    DriverContactState>((ref) => GetDriverContactDataProvider());
