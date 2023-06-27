import 'package:asroo_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/add_to_cart_widget.dart';
import '../widgets/clothes_info_widget.dart';
import '../widgets/size_list_widget.dart';
import '../widgets/slider_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.product,
  });
  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SliderWidget(product: product),
              ClothesInfoWidget(product: product),
              const SizeListWidget(),
              AddToCartWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
