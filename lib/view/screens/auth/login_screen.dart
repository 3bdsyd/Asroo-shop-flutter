import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/text_form_filed_utils.dart';
import '../../../utils/text_utils.dart';
import '../../widgets/elevated_button_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                  ),
                  TextUtils(
                    text: 'LOG',
                    fontWeight: FontWeight.w500,
                    color: context.theme.primaryColor,
                    fontSize: 40,
                    decoration: TextDecoration.none, textAlign: TextAlign.start
                  ),
                  TextUtils(
                    text: '  IN',
                    fontWeight: FontWeight.w500,
                    color: context.theme.highlightColor,
                    fontSize: 40,
                    decoration: TextDecoration.none, textAlign: TextAlign.start
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormFiledUtils(
                        imageString: 'assets/images/email.png',
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {},
                        obscureText: false,
                        suffixIcon: Container(
                          width: 0,
                        ),
                        controller: emailController,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return TextFormFiledUtils(
                            imageString: 'assets/images/lock.png',
                            hintText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {},
                            obscureText: !controller.isVisibility,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: IconButton(
                                onPressed: () {
                                  controller.visibilityFun();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility_sharp),
                                highlightColor: Colors.transparent,
                                color: Colors.grey,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                              ),
                            ),
                            controller: passwordController,
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesName.forgotPasswordScreen);
                            },
                            child: TextUtils(
                                text: 'Forgot Password?',
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 15,
                                decoration: TextDecoration.none, textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade200),
                            child: Image.asset(
                              'assets/images/check.png',
                              color: context.theme.primaryColor,
                            ),
                          ),
                          TextUtils(
                            text: '    Remember me  ',
                            fontWeight: FontWeight.w500,
                            color: context.theme.highlightColor,
                            fontSize: 15,
                            decoration: TextDecoration.none, textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: double.infinity,
                        height: 50,
                        child: GetBuilder<AuthController>(
                          builder: (_) {
                            return ElevatedButtonWidget(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'LOGIN',
                              fontSize: 20,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              TextUtils(
                text: 'OR',
                fontWeight: FontWeight.normal,
                color: context.theme.highlightColor,
                fontSize: 18,
                decoration: TextDecoration.none, textAlign: TextAlign.start
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return GestureDetector(
                        onTap: () {
                          controller.signInWithGoogle();
                        },
                        child: Image.asset('assets/images/google.png'),
                      );
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 25,
                  ),
                  Image.asset('assets/images/facebook.png'),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9.90,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 8.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                      text: "Don't have an Account?  ",
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.none, textAlign: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(RoutesName.signUpScreen);
                      },
                      child: const TextUtils(
                        text: 'Sign Up',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.underline, textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
