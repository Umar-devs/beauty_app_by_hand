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
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
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
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  ReusableText(
                    weight: FontWeight.w700,
                    fontSize: screenWidth * 0.05,
                    lbl: 'Terms And Conditions',
                    clr: Colors.black,
                  ),
                ],
              ),
              TermWithTitle(title: titlesOfTerms[0], term: termsList[0]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[1], term: termsList[1]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[2], term: termsList[2]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[3], term: termsList[3]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[4], term: termsList[4]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[5], term: termsList[5]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[6], term: termsList[6]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[7], term: termsList[7]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[8], term: termsList[8]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[9], term: termsList[9]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[10], term: termsList[10]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[11], term: termsList[11]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[12], term: termsList[12]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[13], term: termsList[13]),
              Divider(
                color: Colors.grey.shade200,
              ),
              TermWithTitle(title: titlesOfTerms[14], term: termsList[14]),
              SizedBox(
                height: screenHeight * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
