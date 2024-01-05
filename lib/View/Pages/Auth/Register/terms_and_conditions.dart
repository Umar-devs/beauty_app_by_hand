import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../Widgets/Reusable Components/reusable_txt.dart';
import 'Components/Widgets/term_condition_lists.dart';
import 'Components/Reusable Components/term_with_title.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        leading: Material(
          color: Colors.transparent,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        backgroundColor: Colors.white,
        title: ReusableText(
          weight: FontWeight.w700,
          fontSize: screenWidth * 0.05,
          lbl: 'Terms And Conditions',
          clr: Colors.black,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03, vertical: screenHeight * 0.015),
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return TermWithTitle(
                    title: titlesOfTerms[index], term: termsList[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.shade200,
                );
              },
              itemCount: titlesOfTerms.length),
        ),
      ),
    );
  }
}
