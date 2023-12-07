import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/repository/store/profile.dart';

class HomeModel {
  HomeModel({
    this.storeImage,
    this.isStoreOnline,
    this.isPickupEnabled,
    this.isDeliveryEnabled,
  });
  final String? storeImage;

  HomeModel copyWith({
    String? storeImage,
    bool? isStoreOnline,
    bool? isPickupEnabled,
    bool? isDeliveryEnabled,
  }) {
    return HomeModel(
      storeImage: storeImage ?? this.storeImage,
      isStoreOnline: isStoreOnline ?? this.isStoreOnline,
      isPickupEnabled: isPickupEnabled ?? this.isPickupEnabled,
      isDeliveryEnabled: isDeliveryEnabled ?? this.isDeliveryEnabled,
    );
  }

  final bool? isDeliveryEnabled;
  final bool? isPickupEnabled;
  final bool? isStoreOnline;
}

class HomeViewModel extends StateNotifier<HomeModel> {
  HomeViewModel(Ref ref) : super(HomeModel()) {
    ref.listen(StoreRepository.storeProvider, (previous, next) {
      final store = next.asData?.value;
      this.state = HomeModel(
        isPickupEnabled: store?.pickup,
        isStoreOnline: store?.isOnline,
        isDeliveryEnabled: store?.delivery,
        storeImage: store?.image,
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
