import 'package:asroo_shop/model/product_model.dart';
import 'package:asroo_shop/view/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../../logic/controllers/product_controller.dart';

class Gri extends StatelessWidget {
  Gri({super.key, required this.productsList});

  final controllerProducts = Get.find<ProductController>();
  final controllerFavorite = Get.find<CartController>();

  final ProductModels productsList;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Get.to(DetailsScreen(product: productsList));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(3, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              controllerProducts.favoriteProduct(
                                productsList.id,
                              );
                            },
                            icon: Icon(
                              controllerProducts.isFavoriteFun(productsList.id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                        ),
                        Text(
                          productsList.title.split(' ')[0],
                          style: const TextStyle(color: Colors.black),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              controllerFavorite.addProduct(productsList);
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        child: Image.network(
                          productsList.image,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
