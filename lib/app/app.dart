import 'package:tezda/core/api/auth.dart';
import 'package:tezda/core/api/product.dart';
import 'package:tezda/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tezda/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tezda/ui/views/home/home_view.dart';
import 'package:tezda/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tezda/ui/views/login/login_view.dart';
import 'package:tezda/ui/views/sign_in/sign_in_view.dart';
import 'package:tezda/ui/views/product_listing/product_listing_view.dart';
import 'package:tezda/ui/views/product_list/product_list_view.dart';
import 'package:tezda/ui/views/product_list_detail/product_list_detail_view.dart';
import 'package:tezda/services/login_service.dart';
import 'package:tezda/services/product_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: ProductListingView),
    MaterialRoute(page: ProductListView, initial: true),
    MaterialRoute(page: ProductListDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: AuthApi),
    LazySingleton(classType: ProductApi),
    LazySingleton(classType: ProductServices),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
