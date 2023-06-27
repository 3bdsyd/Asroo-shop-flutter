import 'package:asroo_shop/model/product_model.dart';
import 'package:asroo_shop/services/category_services.dart';
import 'package:asroo_shop/services/product_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList categoryList = [].obs;
  List<String> categoryImages = [
    'https://thumbs.dreamstime.com/b/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-153892483.jpg',
    'https://www.rd.com/wp-content/uploads/2022/07/GettyImages-152892935.jpg',
    'https://media.istockphoto.com/id/626085868/photo/mens-accessories.jpg?s=612x612&w=0&k=20&c=M4QqVxeUyMeChfMqOucfxtVaVMZ51g00-2tlc_Vgrx0=',
    'https://www.realsimple.com/thmb/QHkrGeiLf4vEV5342LyWEmv5cvI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Real-Simple-work-clothes-for-women-affordable-v1-951a9c4310ee4db59e64f2f66b0fdcfe.jpg',
  ];
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  getCategory() async {
    try {
      var categoryList = await CategoryService.getCategory();
      if (categoryList.isNotEmpty) {
        this.categoryList.addAll(categoryList);
      }
    } finally {
      isLoading(false);
    }
  }

  RxBool isLoadingProduct = true.obs;
  List productList = <ProductModels>[].obs;
  addProducts(String categoryName) async {
    try {
      isLoadingProduct(true);
      var categoryProducts = await ProductServices.getTypeProduct(categoryName);
      if (categoryProducts.isNotEmpty) {
        productList = categoryProducts;
      }
    } finally {
      isLoadingProduct(false);
    }
  }
}
