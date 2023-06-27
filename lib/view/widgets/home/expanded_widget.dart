import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/view/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../logic/controllers/product_controller.dart';
import 'grid_view_widget.dart';

class ExpandedWidget extends StatelessWidget {
  ExpandedWidget({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: Lottie.asset('assets/images/Infinity Loop.json'),
            );
          } else {
            return GetBuilder(
              init: ProductController(),
              builder: (_) {
                return controller.controller.text.isNotEmpty &&
                        controller.searchedList.isEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            TextUtils(
                              text: 'Empty search',
                              fontWeight: FontWeight.w900,
                              color: context.theme.primaryColor,
                              fontSize: 25,
                              decoration: TextDecoration.none,
                              textAlign: TextAlign.center,
                            ),
                            Lottie.asset('assets/images/search.json'),
                          ],
                        ),
                      )
                    : controller.searchedList.isEmpty
                        ? GridView.builder(
                            itemCount: controller.productsList.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: .8,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 9,
                            ),
                            itemBuilder: (context, index) {
                              return GridViewWidget(
                                controller: controller,
                                productModels: controller.productsList[index],
                                id: controller.productsList[index].id,
                                image: controller.productsList[index].image,
                                title: controller.productsList[index].title,
                                onTap: () {
                                  Get.to(
                                    DetailsScreen(
                                      product: controller.productsList[index],
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        : GridView.builder(
                            itemCount: controller.searchedList.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: .8,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 9,
                            ),
                            itemBuilder: (context, index) {
                              return GridViewWidget(
                                controller: controller,
                                productModels: controller.searchedList[index],
                                id: controller.searchedList[index].id,
                                image: controller.searchedList[index].image,
                                title: controller.searchedList[index].title,
                                onTap: () {
                                  Get.to(
                                    DetailsScreen(
                                      product: controller.searchedList[index],
                                    ),
                                  );
                                },
                              );
                            },
                          );
              },
            );
          }
        },
      ),
    );
  }
}
