import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(CartController());
  }
}
