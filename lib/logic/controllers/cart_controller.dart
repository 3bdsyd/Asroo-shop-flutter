import 'package:asroo_shop/model/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  RxMap productsMap = {}.obs;
  GetStorage cartBox = GetStorage();
  RxString cartKey = 'cartKey'.obs;

  void addProduct(ProductModels productModels) {

    cartBox.write(cartKey.value, productModels);

    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    if (productsMap[productModels] == 1) {
      removeCart(productModels);
    } else {
      cartBox.remove(cartKey.value);
      productsMap[productModels] -= 1;
    }
  }

  void removeCart(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void removeAllCarts() {
    productsMap.clear();
  }

  get subPriced {
    return productsMap.entries.map((e) => e.key.price * e.value).toList();
  }

  get totPriced {
    return productsMap.entries
        .map((e) => e.key.price * e.value)
        .reduce((value, element) => value + element)
        .toStringAsPrecision(4);
  }
}
