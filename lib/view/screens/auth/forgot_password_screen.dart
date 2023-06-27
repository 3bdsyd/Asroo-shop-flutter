import 'package:asroo_shop/routes/routes.dart';
import 'package:asroo_shop/utils/text_form_filed_utils.dart';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/validator_utils.dart';
import '../../widgets/elevated_button_widget.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  TextEditingController forgotEmailValid = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor:context.theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: context.theme.highlightColor
        ),
        title: TextUtils(
          text: 'Forgot Password',
          fontWeight: FontWeight.bold,
          color: context.theme.highlightColor,
          fontSize: 20,
          decoration: TextDecoration.none, textAlign: TextAlign.start
        ),
        centerTitle: true,
      ),
      backgroundColor: context.theme.highlightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.offAllNamed(RoutesName.welcomeScreen);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              TextUtils(
                text:
                    'if you want to recover your account then please provide your email ID below',
                color: context.theme.highlightColor,
                decoration: TextDecoration.none,
                fontSize: 18,
                fontWeight: FontWeight.w500, textAlign: TextAlign.start
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              Image.asset(
                'assets/images/forgetpass copy.png',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              TextFormFiledUtils(
                imageString: 'assets/images/email.png',
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!RegExp(emailValid).hasMatch(value)) {
                    return 'Invalid email';
                  } else {
                    return '';
                  }
                },
                obscureText: false,
                suffixIcon: Container(
                  width: 0,
                ),
                controller: forgotEmailValid,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 50,
                child: GetBuilder<AuthController>(
                  builder: (_) {
                    return ElevatedButtonWidget(
                      text: 'SEND',
                      fontSize: 20,
                      onPressed: () {
                        controller.restPassword(forgotEmailValid.text);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
