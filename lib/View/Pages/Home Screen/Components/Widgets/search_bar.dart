import 'package:flutter/material.dart';

import '../../../../../Core/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.06,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth * 0.72,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: themeColor)),
            child: const Center(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: InputBorder.none, // No border
                  hintText: 'Find a service..',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Container(
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
                border: Border.all(color: themeColor),
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Icon(Icons.filter_list),
            ),
          )
        ],
      ),
    );
  }
}
