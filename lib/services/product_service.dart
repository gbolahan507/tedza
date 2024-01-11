import 'package:tezda/app/app.locator.dart';
import 'package:tezda/core/api/product.dart';
import 'package:tezda/core/error/custom_exception.dart';
import 'package:tezda/core/model/product/product.dart';

class ProductServices {
  final _productApi = locator<ProductApi>();

  List<Product> product = [];

  Future<List<Product>> fetchProduct() async {
    try {
      product = await _productApi.fetchProduct();
      print(product.length);
    } on CustomException catch (_) {}
    return product;
  }
}
