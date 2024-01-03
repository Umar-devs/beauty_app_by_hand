import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:flutter/material.dart';

class RoundPinkContainer extends StatelessWidget {
  const RoundPinkContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child});
  final double height;
  final double width;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: themeColor,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50))),
      child: child,
    );
  }
}
