import 'package:flutter/material.dart';

import '../../../Widgets/Reusable Components/reusable_txt.dart';


class OrTextRow extends StatelessWidget {
  const OrTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.073,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: screenWidth * 0.36,
              child: Divider(
                color: Colors.grey.shade400,
              )),
          ReusableText(
              weight: FontWeight.w500,
              fontSize: screenWidth * 0.036,
              clr: Colors.grey.shade500,
              lbl: 'Or'),
          SizedBox(
              width: screenWidth * 0.36,
              child: Divider(
                color: Colors.grey.shade400,
              )),
        ],
      ),
    );
  }
}
