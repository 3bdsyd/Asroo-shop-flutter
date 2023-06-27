import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/favorite/empty_favorite.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final controller = Get.put<ProductController>(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Obx(
        () {
          if (controller.favoriteId.isNotEmpty) {
            return productsFavorite();
          } else {
            return const EmptyFavorite();
          }
        },
      ),
    );
  }

  ListView productsFavorite() {
    return ListView.builder(
      itemCount: controller.favoriteId.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: Offset.zero,
                  blurRadius: 5,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: 100,
                              child: Image.network(
                                controller.favoriteId[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextUtils(
                                  text: controller.favoriteId[index].title
                                      .split(' ')[0],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20,
                                  decoration: TextDecoration.none,
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextUtils(
                                  text:
                                      '${controller.favoriteId[index].price}\$',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        controller.favoriteProduct(
                          controller.favoriteId[index].id,
                        );
                      },
                      icon: const Icon(
                        Icons.favorite,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
