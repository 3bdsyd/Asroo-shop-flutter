import 'package:asroo_shop/logic/controllers/cart_controller.dart';
import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:asroo_shop/routes/routes.dart';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/view/widgets/home/search_from_filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import '../widgets/home/expanded_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(CartController());
  final controllerProduct = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(22),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade900, blurRadius: 5),
                ],
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: TextUtils(
                                text: 'Asroo Shop',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 25,
                                decoration: TextDecoration.none,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Obx(
                              () => badges.Badge(
                                position:
                                    badges.BadgePosition.topEnd(top: -5, end: -5),
                                badgeContent:
                                    Text('${controller.productsMap.length}'),
                                child: IconButton(
                                  onPressed: () {
                                    Get.toNamed(RoutesName.cartScreen);
                                  },
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Find Your',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'INSPIRATION',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 25,
                            decoration: TextDecoration.none,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: searchFiledWidget(),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 100,
                          ),
                          SvgPicture.asset(
                            'assets/images/filter-variant.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextUtils(
                  text: 'Categories',
                  fontWeight: FontWeight.bold,
                  color: context.theme.highlightColor,
                  fontSize: 22,
                  decoration: TextDecoration.none,
                  textAlign: TextAlign.start,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('bottom'),
                ),
              ],
            ),
            ExpandedWidget(),
          ],
        ),
      ),
    );
  }
}
