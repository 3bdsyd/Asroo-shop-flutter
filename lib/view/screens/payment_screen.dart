import 'package:asroo_shop/utils/text_utils.dart';
import 'package:asroo_shop/utils/theme.dart';
import 'package:asroo_shop/view/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: const Text('PayMent'),
          centerTitle: true,
          elevation: 5,
          backgroundColor: Get.isDarkMode ? mainColor : Colors.black,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextUtils(
                      text: 'Shipping to',
                      fontWeight: FontWeight.bold,
                      color: context.theme.highlightColor,
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CardAddressWidget(
                  title: 'Asroo Shop',
                  name: 'asroo store',
                  number: '51-88-04-55',
                  address: 'Badhuisweg 92, 2587 CL Den Haaf',
                  indexRadio: 1,
                  onChanged: () {},
                  color: Get.isDarkMode
                      ? Colors.grey.withOpacity(.1)
                      : Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                CardAddressWidget(
                  title: 'Delivery',
                  name: 'waled mohammed',
                  number: '97-77-44-50',
                  address: 'Egypt 44 Elmessaha Street Docks, Giza',
                  indexRadio: 2,
                  onChanged: () {},
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    TextUtils(
                      text: 'Payment method',
                      fontWeight: FontWeight.bold,
                      color: context.theme.highlightColor,
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      paymentWidget(
                        context,
                        text: '   Shipping To',
                        color: Get.isDarkMode
                            ? Colors.grey.withOpacity(.4)
                            : Colors.grey.withOpacity(.1),
                        value: 1,
                        image: 'assets/images/paypal.png',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      paymentWidget(
                        context,
                        text: '   Google Pay',
                        color: context.theme.scaffoldBackgroundColor,
                        value: 2,
                        image: 'assets/images/google.png',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      paymentWidget(
                        context,
                        text: '   Credit Card',
                        color: context.theme.scaffoldBackgroundColor,
                        value: 3,
                        image: 'assets/images/credit.png',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextUtils(
                  text: 'Total: 180\$',
                  fontWeight: FontWeight.bold,
                  color: context.theme.highlightColor,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButtonWidget(
                    text: 'Pay Now',
                    fontSize: 20,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget paymentWidget(
    BuildContext context, {
    required Color color,
    required int value,
    required String text,
    required String image,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Expanded(
              child: Image.asset(
                image,
              ),
            ),
          ),
          TextUtils(
            text: text,
            fontWeight: FontWeight.bold,
            color: context.theme.highlightColor,
            fontSize: 22,
            decoration: TextDecoration.none,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Radio(
              value: value,
              groupValue: 1,
              onChanged: (val) {},
              fillColor: MaterialStateProperty.resolveWith(
                (states) => context.theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardAddressWidget extends StatefulWidget {
  const CardAddressWidget({
    super.key,
    required this.indexRadio,
    required this.onChanged,
    required this.title,
    required this.name,
    required this.number,
    required this.address,
    required this.color,
  });

  final int indexRadio;
  final Function onChanged;
  final String title;
  final String name;
  final String number;
  final String address;
  final Color color;
  @override
  State<CardAddressWidget> createState() => _CardAddressWidgetState();
}

class _CardAddressWidgetState extends State<CardAddressWidget> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: Offset.zero,
            blurRadius: 5,
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => context.theme.primaryColor),
                value: widget.indexRadio,
                groupValue: groupValue,
                onChanged: widget.onChanged(),
                activeColor: context.theme.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: widget.title,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 21,
                      decoration: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      text: widget.name,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      text: widget.number,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                      text: widget.address,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget ss() {
    return Column();
  }
}
