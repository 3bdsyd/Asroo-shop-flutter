import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/text_utils.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/buy-online.json'),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            text: 'There are no products added to the wishlist.',
            fontWeight: FontWeight.w900,
            color: context.theme.primaryColor,
            fontSize: 25,
            decoration: TextDecoration.none, textAlign: TextAlign.center,
          ),
        SizedBox(height: 200,),
        ],
      ),
    );
  }
}
