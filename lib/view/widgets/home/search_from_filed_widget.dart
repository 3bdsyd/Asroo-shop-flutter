import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/outline_border_widget.dart';

Widget searchFiledWidget() {
  return GetBuilder<ProductController>(
    init: ProductController(),
    builder: (controllerSearch) {
      return TextField(
        onChanged: (searchStr) {
          controllerSearch.searchShopping(searchStr);
        },
        decoration: InputDecoration(
          enabledBorder: TextFormFieldWidget(),
          focusedBorder: TextFormFieldWidget(),
          border: TextFormFieldWidget(),
          suffixIcon: controllerSearch.controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controllerSearch.removeController();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ))
              : const Text(''),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: "Search you're looking for",
          hintStyle: const TextStyle(color: Colors.black),
          fillColor: Colors.grey.shade200,
          filled: true,
        ),
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        controller: controllerSearch.controller,
      );
    },
  );
}
