import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendor/src/repository/store/profile.dart';

class HomeModel {
  HomeModel({
    this.isStoreOnline,
    this.isPickupEnabled,
    this.isDeliveryEnabled,
  });
  final bool? isStoreOnline;
  final bool? isPickupEnabled;
  final bool? isDeliveryEnabled;
}

class HomeViewModel extends StateNotifier<HomeModel> {
  HomeViewModel(Ref ref) : super(HomeModel()) {
    ref.listen(StoreRepository.storeProvider, (previous, next) {
      this.state = HomeModel(
        isPickupEnabled: next.asData?.value?.pickup,
        isStoreOnline: next.asData?.value?.isOnline,
        isDeliveryEnabled: next.asData?.value?.delivery,
      );
    });
  }
}

final homeModelProvider = StateNotifierProvider<HomeViewModel, HomeModel>(
  (ref) => HomeViewModel(ref),
);
