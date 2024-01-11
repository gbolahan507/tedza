import 'dart:convert';

import 'package:tezda/core/base_api.dart';
import 'package:tezda/core/error/custom_exception.dart';
import 'package:tezda/core/error/error_util.dart';
import 'package:tezda/core/model/product/product.dart';
import 'package:http/http.dart' as http;

class ProductApi extends BaseAPI {
  Future<List<Product>> fetchProduct() async {
    try {
      final response = await http.get(Uri.parse("$ksBaseUrl/$ksProductList"));
      // print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList
            .map((addressJson) => Product.fromJson(addressJson))
            .toList();
      } else {
        throw Exception('Failed to load addresses');
      }
    } catch (e) {
      throw CustomException(DioErrorUtil.handleError(e));
    }
  }
}
