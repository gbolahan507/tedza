import 'package:stacked/stacked.dart';

class ProductListDetailViewModel extends BaseViewModel {
  bool doAnimation = false;

  Future enableAnimation() async {
    await Future.delayed(const Duration(), () {
      doAnimation = true;
    });
    notifyListeners();
  }
}
