import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tezda/app/app.locator.dart';
import 'package:tezda/app/app.router.dart';
import 'package:tezda/core/model/product/product.dart';
import 'package:tezda/services/product_service.dart';

class ProductListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _productService = locator<ProductServices>();

  List<Product> get products => _productService.product;

  List<Product> filterResult = [];

  void navigateBack() {
    _navigationService.back();
  }

  void navigateToProductListDetailView(Product product) {
    _navigationService.navigateTo(Routes.productListDetailView,
        arguments: ProductListDetailViewArguments(product: product));
  }

  Future<List<Product>> fetchProduct() async {
    _productService.product =
        await runBusyFuture(_productService.fetchProduct());
    notifyListeners();
    return products;
  }

  Future onSearchProduct(String input) async {
    await fetchProduct();
    final result = _productService.product.where((element) {
      final data = element.title.toString().toLowerCase();
      final query = input.toLowerCase();
      return data.contains(query);
    }).toList();
    filterResult = input.isEmpty ? _productService.product : result;
    notifyListeners();
  }

  Future onSearchProduct2(String input) async {
    final result = _productService.product.where((element) {
      final data = element.title.toString().toLowerCase();
      final query = input.toLowerCase();
      return data.contains(query);
    }).toList();
    filterResult = input.isEmpty ? _productService.product : result;
    notifyListeners();
  }
}
