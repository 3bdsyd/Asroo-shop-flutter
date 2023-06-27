import 'package:asroo_shop/logic/controllers/cart_controller.dart';
import 'package:asroo_shop/view/widgets/gride.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/category_controller.dart';


class GridViewWidget1 extends StatelessWidget {
  GridViewWidget1({
    super.key,
    required this.title,
  });
  final String title;
  final controllerFavorite = Get.find<CartController>();
  final CategoryController controllerCategory = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            leading: Container(
              margin: const EdgeInsets.only(left: 20),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: context.theme.highlightColor,
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(color: context.theme.highlightColor),
            ),
            centerTitle: true,
          ),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: Obx(
            () => controllerCategory.isLoadingProduct.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.theme.primaryColor,
                    ),
                  )
                : Container(
                    color: context.theme.scaffoldBackgroundColor,
                    height: double.infinity,
                    child: GridView.builder(
                      itemCount: controllerCategory.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: .8,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 9,
                      ),
                      itemBuilder: (context, index) {
                        return Gri(
                          productsList: controllerCategory.productList[index],
                        );
                      },
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
