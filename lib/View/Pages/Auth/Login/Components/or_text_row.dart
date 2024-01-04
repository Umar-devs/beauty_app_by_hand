import 'package:beauty_app_by_hand/Core/constants.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/Reusable Components/reusable_txt.dart';

class OrTextRow extends StatelessWidget {
  const OrTextRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];
    double width = screenWidth(context);
    for (int i = 0; i < 3; i++) {
      if (i == 1) {
        rowChildren.add(
          ReusableText(
              weight: FontWeight.w500,
              fontSize: width * 0.036,
              clr: Colors.grey.shade500,
              lbl: 'Or'),
        );
        continue;
      }
      rowChildren.add(
        SizedBox(
            width: width * 0.36,
            child: Divider(
              color: Colors.grey.shade400,
            )),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.073,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: rowChildren,
      ),
    );
  }
}
