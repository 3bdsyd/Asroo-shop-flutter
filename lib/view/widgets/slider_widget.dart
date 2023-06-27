import 'package:asroo_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

import '../../logic/controllers/cart_controller.dart';
import '../../utils/theme.dart';
import 'color_picker_widget.dart';

class SliderWidget extends StatefulWidget {
  final ProductModels product;
  const SliderWidget({
    super.key,
    required this.product,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final controller = Get.put(CartController());
  int activeIndex = 0;
  int colorIndex = 0;
  final List listColors = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: CarouselController(),
          itemCount: listColors.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.product.image),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            autoPlay: true,
            height: 450,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          ),
        ),
        Positioned(
          left: 150,
          top: 420,
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              dotColor: Colors.black,
              activeDotColor: context.theme.primaryColor,
              dotHeight: 10,
            ),
          ),
        ),
        Positioned(
          top: 200,
          right: 20,
          child: Container(
            height: 200,
            width: 60,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(
                height: 7,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        colorIndex = index;
                      });
                    },
                    child: ColorPickerWidget(
                      color: listColors[index],
                      border: index == colorIndex,
                    ));
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: CircleAvatar(
                  backgroundColor: context.theme.primaryColor.withOpacity(.7),
                  foregroundColor: Colors.black,
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                  ),
                ),
              ),
              Obx(
                () {
                  return badges.Badge(
                    badgeContent: Text(
                      '${controller.productsMap.length}',
                    ),
                    child: CircleAvatar(
                      backgroundColor:
                          context.theme.primaryColor.withOpacity(.7),
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.shopping_cart),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
