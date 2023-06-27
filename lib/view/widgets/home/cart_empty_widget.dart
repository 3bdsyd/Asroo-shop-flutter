import 'package:asroo_shop/routes/routes.dart';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/view/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/Triangulo Carga Loading.json'),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(
                text: 'Your Cart is',
                fontWeight: FontWeight.bold,
                color: context.theme.highlightColor,
                fontSize: 22,
                decoration: TextDecoration.none,
                textAlign: TextAlign.center,
              ),
              TextUtils(
                text: ' Empty',
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
                fontSize: 22,
                decoration: TextDecoration.none,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextUtils(
            text: 'Add items to get Started',
            fontWeight: FontWeight.bold,
            color: context.theme.highlightColor,
            fontSize: 15,
            decoration: TextDecoration.none,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 18,
            child: ElevatedButtonWidget(
              text: 'Go to Home',
              fontSize: 20,
              onPressed: () {
                Get.offAllNamed(RoutesName.loginScreen);
              },
            ),
          ),
        
        SizedBox(height: 50,)],
      ),
    );
  }
}
