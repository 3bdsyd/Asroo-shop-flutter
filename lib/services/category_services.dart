import 'package:asroo_shop/model/category_model.dart';
import 'package:http/http.dart' as http;

import '../utils/services_utils.dart';

class CategoryService {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var dateJson = response.body;

      if (dateJson.isNotEmpty) {
        return categoryModelFromJson(dateJson);
      }
    } else {
      return throw Exception('expected');
    }
    return ['_'];
  }
}
