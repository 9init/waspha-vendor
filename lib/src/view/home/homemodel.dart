import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SwitchButtonType { button1, button2, button3 }

class HomeModel extends StateNotifier<Map<SwitchButtonType, bool>> {
  HomeModel()
      : super({
          SwitchButtonType.button1: false,
          SwitchButtonType.button2: false,
          SwitchButtonType.button3: false,
        });
  void toggleSwitch(SwitchButtonType buttonType) {
    state = {
      ...state,
      buttonType: !(state[buttonType] ?? false),
    };
  }
}

final homeModelProvider =
    StateNotifierProvider<HomeModel, Map<SwitchButtonType, bool>>(
  (ref) => HomeModel(),
);
