import 'package:asroo_shop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/text_utils.dart';
import '../widgets/elevated_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(.2),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.2,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 13),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextUtils(
                        text: 'Welcome',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none, textAlign: TextAlign.start
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 13),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextUtils(
                            text: 'Asroo',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColor,
                            decoration: TextDecoration.none, textAlign: TextAlign.start
                          ),
                          const TextUtils(
                            text: '  Shop',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.none, textAlign: TextAlign.start
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4.5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 18,
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: ElevatedButtonWidget(
                        onPressed: () {
                          Get.toNamed(RoutesName.loginScreen);
                        },
                        text: 'Get Start',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TextUtils(
                          text: "Don't have an Account?  ",
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.none, textAlign: TextAlign.start
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesName.signUpScreen);
                          },
                          child: TextUtils(
                            text: 'Sign Up',
                            fontWeight: FontWeight.normal,
                            color: context.theme.primaryColor,
                            fontSize: 15,
                            decoration: TextDecoration.underline, textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
