import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:asroo_shop/model/product_model.dart';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:read_more_text/read_more_text.dart';

class ClothesInfoWidget extends StatelessWidget {
  ClothesInfoWidget({
    super.key,
    required this.product,
  });
  final ProductModels product;
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: context.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextUtils(
                  text: product.title,
                  fontWeight: FontWeight.bold,
                  color: context.theme.highlightColor,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  textAlign: TextAlign.start,
                ),
              ),
              Obx(() {
                return CircleAvatar(
                  backgroundColor:
                      Get.isDarkMode ? Colors.grey[100] : Colors.grey,
                  foregroundColor: Colors.red,
                  child: GestureDetector(
                    onTap: () => controller.favoriteProduct(product.id),
                    child: controller.isFavoriteFun(product.id)
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border_outlined),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  '${product.rating.rate}',
                  style: TextStyle(
                      color: context.theme.highlightColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 5,
                ),
                RatingBarIndicator(
                  rating: product.rating.rate,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.orangeAccent,
                  ),
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 20,
                ),
              ],
            ),
          ),
          ReadMoreText(
            product.description,
            numLines: 3,
            style: TextStyle(color: context.theme.highlightColor,height: 1.5),
            readMoreText: 'Read more',
            readLessText: 'Read less',
            readMoreTextStyle:TextStyle(color: context.theme.primaryColor,fontWeight: FontWeight.bold),
            readMoreIconColor :context.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
