import 'package:flutter_riverpod/flutter_riverpod.dart';

final carDetailViewModelProvider =
    StateNotifierProvider<CarDetailViewModel, bool>(
        (ref) => CarDetailViewModel());

final changeThemeProvider = StateNotifierProvider<CarDetailViewModel, bool>(
        (ref) => CarDetailViewModel());

class CarDetailViewModel extends StateNotifier<bool> {
  CarDetailViewModel() : super(false);

  void favorite() {
    if (state == true) {
      state = false;
    } else {
      state = true;
    }
  }
  void changeTheme() {
    if (state == true) {
      state = false;
    } else {
      state = true;
    }
  }
}
