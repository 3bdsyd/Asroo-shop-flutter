import 'package:asroo_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/product_controller.dart';

class GridViewWidget extends StatelessWidget {
  final ProductModels productModels;
  final int id;
  final String title;
  final String image;
  final Function() onTap;
  GridViewWidget({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.controller,
    required this.productModels,
    required this.onTap,
  });

  final ProductController controller;
  final cont = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
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
                            controller.favoriteProduct(
                              id,
                            );
                          },
                          icon: Icon(
                            controller.isFavoriteFun(id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        ),
                      ),
                      Text(
                        title.split(' ')[0],
                        style: const TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            cont.addProduct(productModels);
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
                        image,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
