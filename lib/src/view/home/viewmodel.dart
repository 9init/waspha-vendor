import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/models/earning/earning_model.dart';
import 'package:vendor/src/repository/store/profile.dart';

class HomeModel {
  HomeModel({
    this.storeImage,
    this.isStoreOnline,
    this.isPickupEnabled,
    this.isDeliveryEnabled,
    this.earnings,
    this.latestUpdate,
  });

  HomeModel copyWith({
    String? storeImage,
    bool? isStoreOnline,
    bool? isPickupEnabled,
    bool? isDeliveryEnabled,
    EarningModel? earnings,
    DateTime? latestUpdate,
  }) {
    return HomeModel(
      storeImage: storeImage ?? this.storeImage,
      isStoreOnline: isStoreOnline ?? this.isStoreOnline,
      isPickupEnabled: isPickupEnabled ?? this.isPickupEnabled,
      isDeliveryEnabled: isDeliveryEnabled ?? this.isDeliveryEnabled,
      earnings: earnings ?? this.earnings,
      latestUpdate: latestUpdate ?? this.latestUpdate,
    );
  }

  final String? storeImage;
  final bool? isDeliveryEnabled;
  final bool? isPickupEnabled;
  final bool? isStoreOnline;
  final EarningModel? earnings;
  final DateTime? latestUpdate;
}

class HomeViewModel extends StateNotifier<HomeModel> {
  HomeViewModel(Ref ref) : super(HomeModel()) {
    ref.listen(StoreRepository.storeProvider, (previous, next) {
      final store = next.asData?.value;
      this.state = this.state.copyWith(
            isPickupEnabled: store?.pickup,
            isStoreOnline: store?.isOnline,
            isDeliveryEnabled: store?.delivery,
            storeImage: store?.image,
          );
    });

    ref.listen(StoreRepository.earningsProvider, (previous, next) {
      this.state = this.state.copyWith(
            earnings: next.asData?.value,
            latestUpdate: DateTime.now(),
          );

      Future.delayed(
        Duration(minutes: 10),
        () => ref.invalidate(StoreRepository.earningsProvider),
      );
    });
  }

  void setStoreOnline(bool value) {
    state = state.copyWith(isStoreOnline: value);
    StoreRepository.updateStoreAttributes(state);
  }

  void setIsPickupEnabled(bool value) {
    state = state.copyWith(isPickupEnabled: value);
    StoreRepository.updateStoreAttributes(state);
  }

  void setIsDeliveryEnabled(bool value) {
    state = state.copyWith(isDeliveryEnabled: value);
    StoreRepository.updateStoreAttributes(state);
  }
}

final homeModelProvider = StateNotifierProvider<HomeViewModel, HomeModel>(
  (ref) => HomeViewModel(ref),
);
