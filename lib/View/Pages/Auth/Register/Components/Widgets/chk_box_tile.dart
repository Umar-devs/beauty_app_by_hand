import 'package:beauty_app_by_hand/Controller/Auth%20Controller/chk_tile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../terms_and_conditions.dart';

class ChkBoxTile extends StatelessWidget {
  ChkBoxTile(
      {super.key, required this.screenWidth, required this.screenHeight});

  final double screenWidth;
  final double screenHeight;
  final ChkBoxController chkBoxController = Get.put(ChkBoxController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth,
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.015,
            ),
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              child: Obx(() => CheckboxListTile(
                    checkColor: Colors.white,
                    activeColor: const Color(0xff063585),
                    title: GestureDetector(
                      onTap: () {
                        Get.to(
                            TermsAndConditions(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                            transition: Transition.rightToLeft);
                      },
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text: 'Accept our ',
                            children: [
                              TextSpan(
                                  text: 'Terms of use and Privacy Policy',
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.027,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ],
                            style: TextStyle(
                                fontSize: screenWidth * 0.029,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                    ),
                    value: chkBoxController.chkValue.value,
                    onChanged: (newValue) {
                      chkBoxController.changeVal(newValue!);
                    },
                    controlAffinity: ListTileControlAffinity
                        .leading, //  <-- leading Checkbox
                  )),
            ),
          ),
        )
      ],
    );
  }
}
