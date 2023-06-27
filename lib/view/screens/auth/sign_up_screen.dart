import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/view/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/text_form_filed_utils.dart';
import '../../../utils/validator_utils.dart';
import '../../widgets/elevated_button_widget.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

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
                    text: 'SIGN',
                    fontWeight: FontWeight.w500,
                    color: context.theme.primaryColor,
                    fontSize: 40,
                    decoration: TextDecoration.none, textAlign: TextAlign.start,
                  ),
                  TextUtils(
                    text: '  UP',
                    fontWeight: FontWeight.w500,
                    color: context.theme.highlightColor,
                    fontSize: 40,
                    decoration: TextDecoration.none, textAlign: TextAlign.start,
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
                  key: fromKey,
                  child: Column(
                    children: [
                      TextFormFiledUtils(
                        imageString: 'assets/images/user.png',
                        hintText: 'User Name',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.toString().length < 2 ||
                              !RegExp(nameValid).hasMatch(value)) {
                            return 'Invalid name';
                          } else {
                            return null;
                          }
                        },
                        obscureText: false,
                        suffixIcon: Container(
                          width: 0,
                        ),
                        controller: nameController,
                      ),
                      TextFormFiledUtils(
                        imageString: 'assets/images/email.png',
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!RegExp(emailValid).hasMatch(value)) {
                            return 'Invalid email';
                          } else {
                            return null;
                          }
                        },
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
                            validator: (value) {
                              if (!RegExp(passwordValid).hasMatch(value)) {
                                return 'Password Invalid';
                              } else {
                                return null;
                              }
                            },
                            obscureText: controller.isVisibility,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: IconButton(
                                onPressed: () {
                                  controller.visibilityFun();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(Icons.visibility_sharp)
                                    : const Icon(Icons.visibility_off),
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
                        children: [
                          GetBuilder<AuthController>(
                            builder: (_) => GestureDetector(
                              onTap: () {
                                controller.checkBox();
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
                                ),
                                child: controller.isCheck
                                    ? Image.asset(
                                        'assets/images/check.png',
                                        color: context.theme.primaryColor,
                                      )
                                    : const Text(''),
                              ),
                            ),
                          ),
                          TextUtils(
                            text: '    I accept  ',
                            fontWeight: FontWeight.w500,
                            color: context.theme.highlightColor,
                            fontSize: 15,
                            decoration: TextDecoration.none, textAlign: TextAlign.start,
                          ),
                          TextUtils(
                            text: 'terms & conditions',
                            fontWeight: FontWeight.w500,
                            color: context.theme.highlightColor,
                            fontSize: 15,
                            decoration: TextDecoration.underline, textAlign: TextAlign.start,
                          )
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
                                if (fromKey.currentState!.validate()) {
                                  if (!controller.isCheck) {
                                    return snackbarWidget(
                                        title: 'Check Box',
                                        message:
                                            'Shod be check box before sign up');
                                  }
                                  controller.signUp(
                                    emailController: emailController.text,
                                    passwordController: passwordController.text,
                                  );
                                }
                              },
                              text: 'SIGN UP',
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
                height: MediaQuery.of(context).size.height / 5.13,
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
                      text: 'Already you have an Account?  ',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.none, textAlign: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(RoutesName.loginScreen);
                      },
                      child: const TextUtils(
                        text: 'Log in',
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
