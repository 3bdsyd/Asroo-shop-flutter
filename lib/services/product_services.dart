import 'package:asroo_shop/model/product_model.dart';
import 'package:http/http.dart' as http;

import '../utils/services_utils.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(
      Uri.parse('$baseUrl/products'),
    );
    if (response.statusCode == 200) {
      var dateJson = response.body;
      return productModelsFromJson(dateJson);
    } else {
      return throw Exception();
    }
  }

  static Future<List<ProductModels>> getTypeProduct(String categoryName) async {
    var response = await http.get(
      Uri.parse('$baseUrl/products/category/$categoryName'),
    );
    if (response.statusCode == 200) {
      var dateJson = response.body;
      return productModelsFromJson(dateJson);
    } else {
      return throw Exception();
    }
  }
}
