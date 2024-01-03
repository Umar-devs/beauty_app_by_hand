import 'package:flutter/material.dart';

import '../../../../Widgets/Reusable Components/reusable_txt.dart';


class TermWithTitle extends StatelessWidget {
  const TermWithTitle({super.key, required this.title, required this.term});
  final String title;
  final String term;
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
                weight: FontWeight.w600,
                fontSize: screenWidth * 0.036,
                clr: Colors.black,
                lbl: title),
          ),
          const SizedBox(height: 2,),
          Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
                alignTxt: TextAlign.start,
                weight: FontWeight.w500,
                clr: Colors.grey,
                fontSize: screenWidth * 0.03,
                lbl: term),
          ),
        ],
      ),
    );
  }
}
