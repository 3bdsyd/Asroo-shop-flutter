import 'package:asroo_shop/logic/controllers/category_controller.dart';
import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:asroo_shop/utils/text_utils.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/grid_view_widget1.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final ProductController controllerProducts = Get.find<ProductController>();
  final CategoryController controllerCategory = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Obx(
          () => controllerCategory.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: context.theme.primaryColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          TextUtils(
                            text: 'Category',
                            fontWeight: FontWeight.w800,
                            color: context.theme.highlightColor,
                            fontSize: 30,
                            decoration: TextDecoration.none,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controllerCategory.addProducts(
                                  controllerCategory.categoryList[index],
                                );
                                Get.to(
                                  GridViewWidget1(
                                    title:
                                        controllerCategory.categoryList[index],
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.9),
                                                offset: const Offset(10, 5),
                                                blurRadius: 5)
                                          ],
                                        ),
                                        child: Image.network(
                                          controllerCategory
                                              .categoryImages[index],
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 10,
                                    child: Text(
                                      controllerCategory.categoryList[index],
                                      style: const TextStyle(
                                        backgroundColor: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15,
                                        decoration: TextDecoration.none,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: controllerCategory.categoryList.length,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
