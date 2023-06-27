import 'package:asroo_shop/model/product_model.dart';
import 'package:asroo_shop/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productsList = <ProductModels>[].obs;
  RxBool isLoading = true.obs;
  GetStorage favoriteStorage = GetStorage();
  final RxString keyFavorite = "keyFavorite".obs;
  RxBool isFavorite = false.obs;
  var favoriteId = <ProductModels>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
    List? favoriteStorageList = favoriteStorage.read<List>(keyFavorite.value);
    if (favoriteStorageList != null) {
      favoriteId = favoriteStorageList
          .map(
            (element) => ProductModels.fromJson(element),
          )
          .toList()
          .obs;
    }
  }

  getProduct() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  favoriteProduct(int idProduct) {
    int index = favoriteId.indexWhere(
      (element) => element.id == idProduct,
    );
    index >= 0
        ? {
            favoriteId.removeAt(index),
            favoriteStorage.remove(keyFavorite.value),
          }
        : {
            favoriteId.add(
              productsList.firstWhere(
                (element) => idProduct == element.id,
              ),
            ),
            favoriteStorage.write(keyFavorite.value, favoriteId),
          };
  }

  bool isFavoriteFun(int idProduct) {
    return favoriteId.any(
      (element) => element.id == idProduct,
    );
  }

  var listShopping = <ProductModels>[].obs;
  addToListShop(int id) {
    int index = listShopping.indexWhere((element) => element.id == id);
    index == -1
        ? listShopping.add(
            productsList.firstWhere((element) => id == element.id),
          )
        : listShopping.removeAt(index);
  }

  bool isShopping(int id) {
    return listShopping.any((element) => id == element.id);
  }

  //search for shopping
  List searchedList = <ProductModels>[].obs;
  TextEditingController controller = TextEditingController();
  void searchShopping(String searchStr) {
    searchedList = productsList
        .where(
          (search) =>
              search.title.toLowerCase().contains(searchStr.toLowerCase()),
        )
        .toList();
    update();
  }

  void removeController() {
    controller.clear();
    searchShopping("");
  }

  String getStrImageCategory(String strCategory) {
    return productsList
        .firstWhere((element) => element.category.toString() == strCategory)
        .toString();
  }
}
