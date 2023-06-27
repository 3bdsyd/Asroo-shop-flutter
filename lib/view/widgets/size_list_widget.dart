import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeListWidget extends StatefulWidget {
  const SizeListWidget({super.key});

  @override
  State<SizeListWidget> createState() => _SizeListWidgetState();
}

class _SizeListWidgetState extends State<SizeListWidget> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];

  int sizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 70,
      color: context.theme.scaffoldBackgroundColor,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  sizeIndex = index;
                });
              },
              child: Container(
                height: 45,
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == sizeIndex
                      ? context.theme.primaryColor.withOpacity(.2)
                      : Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  sizeList[index],
                  style: TextStyle(
                    color: context.theme.highlightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: sizeList.length,
      ),
    );
  }
}
