import 'package:stacked/stacked.dart';
import 'package:tezda/app/app.locator.dart';
import 'package:tezda/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tezda/core/storage/local_storage.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final String? loginData = AppStorage.getToken();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 2));
    if (loginData == "") {
      _navigationService.replaceWithLoginView();
    } else {
      _navigationService.replaceWithProductListView();
    }
  }
}
