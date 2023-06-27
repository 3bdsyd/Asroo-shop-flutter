import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:asroo_shop/model/product_model.dart';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/view/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../widgets/elevated_button_widget.dart';
import '../widgets/home/cart_empty_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final proController = Get.find<ProductController>();
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          toolbarHeight: 100,
          backgroundColor: context.theme.primaryColor,
          title: const TextUtils(
            text: 'Items Cart',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            decoration: TextDecoration.none,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.removeAllCarts();
              },
              icon: const Icon(Icons.remove_shopping_cart),
            )
          ],
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Obx(
          () => controller.productsMap.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CartExpandedWidget(
                            controller: controller,
                            index: index,
                            productModels:
                                controller.productsMap.keys.toList()[index],
                          );
                        },
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const TextUtils(
                                text: 'Total',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                                textAlign: TextAlign.center,
                              ),
                              TextUtils(
                                text: '${controller.totPriced}\$',
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
                              height: double.infinity,
                              width: 230,
                              child: ElevatedButtonWidget(
                                text: 'Check Out',
                                fontSize: 25,
                                onPressed: () => {
                                  Get.to(const PaymentScreen()),
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const CartEmptyWidget(),
        ),
      ),
    );
  }
}

class CartExpandedWidget extends StatelessWidget {
  final int index;
  final CartController controller;
  final ProductModels productModels;

  const CartExpandedWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.productModels,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                productModels.image,
                width: 75,
                height: 100,
              ),
            ),
            SizedBox(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: productModels.title,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextUtils(
                    text:
                        '${controller.subPriced[index].toStringAsPrecision(4)} \$',
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.addProduct(productModels);
                      },
                      icon: CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: context.theme.primaryColor,
                        child: const Icon(Icons.add),
                      ),
                    ),
                    TextUtils(
                      text: '${controller.productsMap.values.toList()[index]}',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      onPressed: () {
                        controller.removeOneProduct(productModels);
                      },
                      icon: CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: context.theme.primaryColor,
                        child: Center(
                          child: Image.asset(
                            'assets/images/minus.png',
                            color: Colors.white,
                            width: 18,
                            height: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.removeCart(productModels);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
