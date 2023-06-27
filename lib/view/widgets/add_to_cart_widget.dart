import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../../model/product_model.dart';
import '../../utils/text_utils.dart';
import 'elevated_button_widget.dart';

class AddToCartWidget extends StatelessWidget {
  AddToCartWidget({super.key, required this.product});
  final controller = Get.put(CartController());
  final ProductModels product;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TextUtils(
                  text: 'Price',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  textAlign: TextAlign.center,
                ),
                TextUtils(
                  text: '${product.price}\$',
                  fontWeight: FontWeight.bold,
                  color: context.theme.highlightColor,
                  fontSize: 30,
                  decoration: TextDecoration.none,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: 70,
                child: ElevatedButtonWidget(
                  text: 'Add To Cart',
                  fontSize: 25,
                  onPressed: () => {
                    controller.addProduct(product),
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
